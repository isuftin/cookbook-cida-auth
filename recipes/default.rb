#
# Cookbook Name:: cida-auth
# Recipe:: default
#

include_recipe "cida-auth::database"

include_recipe "cida-auth::appstack"