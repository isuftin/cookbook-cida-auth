#
# Cookbook Name:: cida-auth
# Recipe:: database
# Author: Phethala Thongsavanh < thongsav@usgs.gov >, Ivan Suftin < isuftin@usgs.gov >
#
# Description: Creates the liquibase user, optionally installs the Oracle OJDBC jar

jdbc_driver_class = node["cida-auth"]["jdbc_driver_class"]
jdbc_maven_group_id = node["cida-auth"]["jdbc_maven_group_id"]
jdbc_maven_artifact_id = node["cida-auth"]["jdbc_maven_artifact_id"]
jdbc_maven_version = node["cida-auth"]["jdbc_maven_version"]
schema_name = node['cida-auth']['schema_name']
data_bag_name = node['cida-auth']['credentials_data_bag_name']
data_bag_item = node['cida-auth']['credentials_data_bag_item']
data_bag_username_field = node['cida-auth']['data_bag_username_field']
data_bag_password_field = node['cida-auth']['data_bag_password_field']
credential_data_bag = data_bag_item(data_bag_name, data_bag_item)
username = credential_data_bag[data_bag_username_field]
pass = credential_data_bag[data_bag_password_field]
cida_auth_version = node['cida-auth']['cida_auth_version']
db_connection = node['cida-auth']['db_connection']

os_user_name = "liquibase"
group_name = os_user_name


# create liquibase group
group group_name

#create liquibase user
user os_user_name do
  comment "#{os_user_name} user used to access #{os_user_name} services"
  system true
  gid group_name
  manage_home true
  home "/home/#{os_user_name}"
end


#if we are using the oracle driver, we have to install the jar in the local mvn repo so the liquibase plugin can use it
if jdbc_driver_class == "oracle.jdbc.OracleDriver"
  # Bring in the needed ojdbc jar
  ojdbc_name = node["cida-auth"]["jdbc_driver_name"]
  ojdbc_jar = "#{ojdbc_name}.jar"
  cookbook_file File.expand_path(ojdbc_jar, "/home/liquibase") do
    owner os_user_name
    group group_name
    source ojdbc_jar
  end

  repo_location = "/home/#{os_user_name}/.m2/repository"
  lib_group_name = "localDependency"

  # Test whether or not this jar already exists. If so, do not re-run
  execute "install_mvn_ojdbc" do
    user os_user_name
    group group_name
    cwd "/home/#{os_user_name}"
    command "mvn install:install-file -Dmaven.repo.local=#{repo_location} -Dfile=#{ojdbc_jar} -DgroupId=#{lib_group_name} -DartifactId=#{ojdbc_name} -Dversion=#{ojdbc_name} -Dpackaging=jar"
    not_if do ::File.exists?("#{repo_location}/#{lib_group_name}/#{ojdbc_name}/#{ojdbc_name}/#{ojdbc_name}-#{ojdbc_jar}") end
  end
end

template '/home/liquibase/pom.xml' do
  owner os_user_name
  group group_name
  source "pom.xml.erb"
  sensitive true
  variables(
    :cida_auth_version => cida_auth_version,
    :schema_name => schema_name,
    :jdbc_maven_group_id => jdbc_maven_group_id,
    :jdbc_maven_artifact_id => jdbc_maven_artifact_id,
    :jdbc_maven_version => jdbc_maven_version,
    :db_driver => jdbc_driver_class,
    :db_connection => db_connection,
    :db_username	=> username,
    :db_password => pass
  )
end

# bash "run_maven_liquibase" do
#   cwd "/home/liquibase"
#   code "mvn dependency:unpack liquibase:update"
#   action :run
# end
