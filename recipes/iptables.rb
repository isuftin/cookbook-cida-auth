#
# Cookbook Name:: cida-auth
# Recipe:: iptables
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: Sets up iptables for the machine

iptables_rule 'iptables_rule_tomcat_8080' do
  action :enable
end

iptables_rule 'iptables_rule_tomcat_8443' do
  action :enable
end
