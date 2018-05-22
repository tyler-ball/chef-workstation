#
# Cookbook:: cws
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

chef_ingredient 'chef-workstation' do
  channel :current
  action :install
end
