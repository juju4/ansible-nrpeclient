#require 'spec_helper'
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('nrpe'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('nagios-nrpe-server'), :if => os[:family] == 'ubuntu' || os[:family] == 'debian' do
  it { should be_installed }
end

describe service('nrpe'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe service('nagios-nrpe-server'), :if => os[:family] == 'ubuntu' || os[:family] == 'debian' do
  it { should be_enabled }
  it { should be_running }
end

describe service('org.macports.nrpe'), :if => os[:family] == 'darwin' do
  it { should be_enabled }
  it { should be_running }
end

describe port(5666) do
  it { should be_listening }
end

describe command('/usr/lib/nagios/plugins/check_nrpe -H localhost'), :if => os[:family] == 'ubuntu' || os[:family] == 'debian' do
  its(:stdout) { should match /NRPE v2.1\d/ }
  its(:stderr) { should_not match /Timeout/ }
  its(:exit_status) { should eq 0 }
end
describe command('/usr/lib64/nagios/plugins/check_nrpe -H localhost'), :if => os[:family] == 'redhat' do
  its(:stdout) { should match /NRPE v2.15/ }
  its(:stderr) { should_not match /Timeout/ }
  its(:exit_status) { should eq 0 }
end

