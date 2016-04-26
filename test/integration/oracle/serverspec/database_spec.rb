require 'spec_helper'

liquibase = 'liquibase'

require_relative '../../integration/default/serverspec/database_spec.rb'

describe file("/home/#{liquibase}/.m2/repository/localDependency/ojdbc6/ojdbc6/ojdbc6-ojdbc6.jar") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by liquibase }
  it { should be_grouped_into liquibase }
end
