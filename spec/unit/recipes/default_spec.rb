#
# Cookbook:: infra.chef.cookbook.automate_test1
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'infra.chef.cookbook.automate_test1::default' do
  context 'When all attributes are default, on Window 2012R2' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'windows', version: '2012R2') do |node|
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'When all attributes are default, on CentOS 7.4.1708' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.4.1708')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
