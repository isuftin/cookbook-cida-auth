require 'spec_helper'

describe command('/opt/tomcat/bin/tomcat status') do
  its(:stdout) { should contain('is running') }
  let(:sudo_options) { '-u tomcat -i' }
end

describe file('/opt/tomcat/instance/default/logs/cida-auth/auth-manager-console.log') do
  it { should be_file }
end

describe file('/opt/tomcat/instance/default/logs/cida-auth/auth-manager-core.log') do
  it { should be_file }
end

describe file('/opt/tomcat/instance/default/logs/cida-auth/cida-auth-webservice.log') do
  it { should be_file }
end
