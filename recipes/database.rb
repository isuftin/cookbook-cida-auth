#
# Cookbook Name:: cida-auth
# Recipe:: database
# Author: Phethala Thongsavanh < thongsav@usgs.gov >, Ivan Suftin < isuftin@usgs.gov >
#
# Description: Creates the liquibase user, optionally installs the Oracle OJDBC jar

cida_auth_version = node["cida-auth"]["version"]["cida_auth"]
database_config = node["cida-auth"]["database"]
database_type = database_config["type"]
schema_name = database_config["schema_name"]
db_name = database_config["name"]
db_host = database_config["host"]
db_port = database_config["port"]
runas_user = database_config["liquibase"]["runas"]
jdbc_maven_group_id = database_config["jdbc_maven_group_id"]
jdbc_maven_artifact_id = database_config["jdbc_maven_artifact_id"]
jdbc_maven_version = database_config["jdbc_driver_version"]
jdbc_driver_location = database_config["jdbc_driver_location"]

data_bag_name = node['cida-auth']['credentials_data_bag_name']
data_bag_item = node['cida-auth']['credentials_data_bag_item']
data_bag_username_field = database_config['data_bag_username_field']
data_bag_password_field = database_config['data_bag_password_field']
credential_data_bag = data_bag_item(data_bag_name, data_bag_item)
username = credential_data_bag[data_bag_username_field]
pass = credential_data_bag[data_bag_password_field]
os_user_name = "liquibase"
group_name = os_user_name
home = "/home/#{os_user_name}"
repo_location = "#{home}/.m2/repository"

# create liquibase group
group group_name

#create liquibase user
user os_user_name do
  comment "#{os_user_name} user used to access #{os_user_name} services"
  system true
  gid group_name
  manage_home true
  home home
end

#if we are using the oracle driver, we have to install the jar in the local mvn repo so the liquibase plugin can use it
if database_type == "oracle"
  driver_group_name="com.oracle"
  profile="cida-auth-liquibase-oracle"

  # Bring in the needed ojdbc jar
  ojdbc_jar = "#{jdbc_maven_artifact_id}.jar"
  ojdbc_jar_location = "#{home}/#{ojdbc_jar}"
  remote_file ojdbc_jar_location do
    owner os_user_name
    group group_name
    source jdbc_driver_location
  end

  # Test whether or not this jar already exists. If so, do not re-run
  execute "install_mvn_ojdbc" do
    user os_user_name
    group group_name
    cwd home
    command "mvn install:install-file -Dmaven.repo.local=#{repo_location} -Dfile=#{ojdbc_jar_location} -DgroupId=#{driver_group_name} -DartifactId=#{jdbc_maven_artifact_id} -Dversion=#{jdbc_maven_version} -Dpackaging=jar"
    not_if do ::File.exists?("#{repo_location}/com/oracle/#{jdbc_maven_artifact_id}/#{jdbc_maven_version}/#{jdbc_maven_artifact_id}-#{jdbc_maven_version}.jar") end
  end
else
  profile="cida-auth-liquibase-postgres"
end

# Pull down cida-auth - if new version, create template, unpackage repo and run maven against database
github_url="https://codeload.github.com/USGS-CIDA/cida-auth/tar.gz/auth-parent-#{cida_auth_version}"
archive="#{home}/auth-parent.tar.gz"
expanded_location="#{home}/cida-auth-auth-parent-#{cida_auth_version}"
liquibase_location="#{expanded_location}/auth-database"
settings_file="#{Chef::Config[:file_cache_path]}/mvn_settings.xml"

# Create a Maven settings file to put properties into.
# If properties changed, run liquibase again
template settings_file do
  source "maven_liquibase_settings.xml.erb"
  variables({
              :profile_id => profile,
              :schema_name => schema_name,
              :db_name => db_name,
              :username => username,
              :pass => pass,
              :runas_user => runas_user,
              :db_host => db_host,
              :db_port => db_port
  })
  sensitive true
  notifies :run, "execute[run_liquibase]", :delayed
end

remote_file archive do
  user os_user_name
  source github_url
  notifies :run, "execute[unpackage_archive]", :immediately
  notifies :run, "execute[run_liquibase]", :immediately
end

# Unpackage cida-auth liquibase
execute "unpackage_archive" do
  user os_user_name
  group group_name
  command "/bin/tar xzfv #{archive}"
  cwd home
  action :nothing
end

# Only perform liquibase run when a new version of the cida-auth liquibase jar has been downloaded
execute "run_liquibase" do
  user os_user_name
  group group_name
  command "mvn -X -s #{settings_file} -Dmaven.repo.local=#{repo_location} install -P #{profile}"
  user os_user_name
  cwd liquibase_location
  action :nothing
end
