#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2015, YOUR COMPANY NAME.
#
# All rights reserved - Do Not Redistribute
#
package "ntp" do
    action :install
end

service "ntpd" do
    supports :status => true, :restart => true
    action [ :enable, :start ]
end

template "/etc/ntp.conf" do
    source "ntp.conf.erb"
    owner  "root"
    group  "root"
    mode   0644
    notifies :restart, 'service[ntpd]'
end
