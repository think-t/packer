require 'spec_helper'

describe file('/etc/selinux/config') do
  its(:content) { should match 'SELINUX=disabled' }
end
