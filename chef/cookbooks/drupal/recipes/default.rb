#
# Cookbook Name:: drupal
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


for p in [ "php5-gd",  "php5-mysql" ] do
    package p do
        action [:install]
    end
end
