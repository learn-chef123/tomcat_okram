#
# Cookbook Name:: tomcat_okram
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


group 'tomcat'

user 'tomcat' do
  gid 'tomcat'
  home '/opt/tomcat'
  shell '/bin/faslse'
end

ark 'tomcat' do
  url 'http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.9/bin/apache-tomcat-8.5.9.tar.gz'
  action :put
  path '/opt'
  owner 'tomcat'
  group 'tomcat'
end


%w[ /etc/systemd /etc/systemd/system ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0755'
  end
end

template '/etc/systemd/system/tomcat.service' do
  source 'tomcat.service.erb'
  notifies :reload, 'service[tomcat]', :immediately
end

service 'tomcat' do
  action [:enable, :start]
end
