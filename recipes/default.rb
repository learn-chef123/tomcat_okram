#
# Cookbook Name:: tomcat_okram
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


group node['tomcat']['group']

user node['tomcat']['user'] do
  gid node['tomcat']['group']
  home node['tomcat']['user_home']
  shell node['tomcat']['user_shell']
end

ark 'tomcat' do
  url "http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v#{node['tomcat']['version']}/bin/apache-tomcat-#{node['tomcat']['version']}.tar.gz"
  action :put
  path node['tomcat']['install_dir']
  owner node['tomcat']['user']
  group node['tomcat']['group']
end


template '/etc/systemd/system/tomcat.service' do
  source 'tomcat.service.erb'
  notifies :reload, 'service[tomcat]', :immediately
end

service 'tomcat' do
  action [:enable, :start]
end
