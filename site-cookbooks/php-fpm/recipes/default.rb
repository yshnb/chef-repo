#
# Cookbook Name:: php-fpm
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "php-fpm"

service "php-fpm" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
