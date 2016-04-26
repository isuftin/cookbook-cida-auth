require 'spec_helper'

liquibase = 'liquibase'

describe group(liquibase) do
  it { should exist }
end

describe user(liquibase) do
  it { should exist }
  it { should belong_to_group liquibase }
  it { should belong_to_primary_group liquibase }
  it { should have_home_directory "/home/#{liquibase}" }
end

describe file("/home/#{liquibase}") do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by liquibase }
  it { should be_grouped_into liquibase }
end