#
# Cookbook Name:: drupal
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


web_app "drupal" do 
  server_name "localhost"
  docroot "/var/www"
  template "drupal.conf.erb" 
end

# Install required PHP5 modules for Drupal
package "php5-gd" do
    action [:install]
end

# Install PHP5 APC for caching
package "php5-apcu" do
    action [:install]
end

#Create a Drupal database & User
mysql_connection_info = {:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']}

mysql_database "drupal" do
    connection mysql_connection_info
    action :create
end

mysql_database_user 'drupal' do
    connection mysql_connection_info
    password 'drupal'
    action :create
end

mysql_database_user 'drupal' do
    database_name 'drupal'
    host 'localhost'
    action :grant
end
