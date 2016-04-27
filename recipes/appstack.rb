#
# Cookbook Name:: cida-auth
# Recipe:: appstack
# Author: Phethala Thongsavanh < thongsav@usgs.gov >, Ivan Suftin < isuftin@usgs.gov >
#
# Description: Installs CIDA Auth onto a Tomcat instance

cida_auth_version = node["cida-auth"]["version"]["cida_auth"]
manager_console_version = node["cida-auth"]["version"]["manager_console"]
manager_core_version = node["cida-auth"]["version"]["manager_core"]
cida_maven = "http://cida.usgs.gov/maven/cida-public-releases/gov/usgs/cida/auth"
manager_core = "#{cida_maven}/auth-manager-core/#{manager_core_version}/auth-manager-core-#{manager_core_version}.war"
manager = "#{cida_maven}/auth-manager-console/#{manager_console_version}/auth-manager-console-#{manager_console_version}.war"
cida_auth = "#{cida_maven}/auth-webservice/#{cida_auth_version}/auth-webservice-#{cida_auth_version}.war"

# all app components
node.default["wsi_tomcat"]["instances"]["default"]["application"]["core"]['url'] = manager_core
node.default["wsi_tomcat"]["instances"]["default"]["application"]["manager"]['url'] = manager
node.default["wsi_tomcat"]["instances"]["default"]["application"]["cida_auth"]['url'] = cida_auth

include_recipe "wsi_tomcat::default"
include_recipe "wsi_tomcat::download_libs"
include_recipe "wsi_tomcat::update_context"
include_recipe "wsi_tomcat::deploy_application"
include_recipe "iptables::default"

iptables_rule 'iptables_rule_tomcat_8080' do
  action :enable
end

iptables_rule 'iptables_rule_tomcat_8443' do
  action :enable
end
