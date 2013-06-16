#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "nginx"

template "/etc/nginx/conf.d/default.conf" do
  owner "root"
  mode 0644
  source "default.conf.erb"
end

node[:nginx][:servers].each do |server|
  template "/etc/nginx/conf.d/#{server[:server_name]}.conf" do
    owner "root"
    mode 0644
    source "server.conf.erb"

    variables({
      :server_name => server[:server_name]
    })
  end
  
  directory "/var/www/#{server[:server_name]}" do
    owner "vagrant"
    group "nginx"
    mode 0775
    action :create
  end

end
service 'nginx' do
  action :restart
end
