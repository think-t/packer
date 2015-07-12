require 'spec_helper'

describe file('/etc/init.d/ntpd') do
  it { should be_executable }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe service('ntpd') do
  it { should be_enabled }
  it { should be_running }
end

describe process('ntpd') do
  it { should be_running }
end

describe port(123) do
  it { should be_listening.with('udp') }
end

describe file('/etc/ntp.conf') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should contain 'server 0.amazon.pool.ntp.org' }
  it { should contain 'server 1.amazon.pool.ntp.org' }
  it { should contain 'server 2.amazon.pool.ntp.org' }
  it { should contain 'server 3.amazon.pool.ntp.org' }
  it { should contain 'disable monitor' }
end

describe user('ntp') do
  it { should exist }
  it { should belong_to_group 'ntp' }
  it { should have_uid 38 }
  it { should have_home_directory '/etc/ntp' }
  it { should have_login_shell '/sbin/nologin' }
end

describe group('ntp') do
  it { should exist }
  it { should have_gid 38 }
end
