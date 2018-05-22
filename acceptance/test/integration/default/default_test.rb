# # encoding: utf-8

# Inspec test for recipe libs::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
describe package('chef-workstation') do
  it { should be_installed }
end

describe command('chef-run --help') do
  its('stdout') { should include "Chef Run is a tool to execute ad-hoc tasks using Chef.\n" }
end
