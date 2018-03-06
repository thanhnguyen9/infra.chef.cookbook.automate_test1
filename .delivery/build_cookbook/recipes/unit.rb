#
# Cookbook:: build_cookbook
# Recipe:: unit
#
# Copyright:: 2018, The Authors, All Rights Reserved.

if delivery_environment == 'verify'
  required_coverage = 70

  Dir.chdir(workflow_workspace_repo){
    coverage = shell_out("chef exec rspec | grep \"Touch Coverage\" |cut -d\":\" -f 2|awk '{$1=$1};1'")
    coverage.run_command
    test_coverage = coverage.stdout.to_f
    test_coverage = 100.0 if coverage.stdout == ''
  
    raise "You need to write Chefspec tests to cover at least 70% the resources, your current coverage is #{test_coverage}%" if test_coverage < required_coverage

    berks_info = shell_out("chef exec berks info #{workflow_change_project} | grep \"0.0.0\"")
    berks_info.run_command
    unpinned = berks_info.stdout
  
    raise "Your cookbook has unpinned dependencies" if unpinned.length > 0
  }
  
end

include_recipe 'delivery-truck::unit'
