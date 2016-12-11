# # encoding: utf-8

# Inspec test for recipe tomcat_okram::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

# unless os.windows?
#   describe user('root') do
#     it { should exist }
#     skip 'This is an example test, replace with your own test.'
#   end
# end
#
# describe port(80) do
#   it { should_not be_listening }
#   skip 'This is an example test, replace with your own test.'
# end

describe group('tomcat') do
  it { should exist }
end

describe user('tomcat') do
  it { should exist}
end

describe file('/opt/tomcat') do
  it { should exist }
  it { should be_directory }
end

describe file('/etc/systemd/system/tomcat.service') do
  it { should exist }
end
