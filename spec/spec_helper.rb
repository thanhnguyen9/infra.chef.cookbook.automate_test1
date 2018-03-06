# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'

# To support code coverage in Chef Automate

at_exit { ChefSpec::Coverage.report! }
