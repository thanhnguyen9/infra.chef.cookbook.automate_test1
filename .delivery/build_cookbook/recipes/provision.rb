#
# Cookbook:: build_cookbook
# Recipe:: provision
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'delivery-truck::provision'

delivery_test_kitchen 'quality_converge_destroy' do
  driver 'ec2'
  yaml ".kitchen.delivery.yml"
  action [:test]
  repo_path delivery_workspace_repo
end
