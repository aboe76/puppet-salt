require 'spec_helper'

describe 'salt' do

  context 'on unsupported distributions' do
    let(:facts) {{ :osfamily => 'Unsupported' }}

    it 'we fail' do
      should compile.and_raise_error(/Unsupported platform: Unsupported/)
    end
  end

  ['Debian', 'RedHat', 'SUSE', ].each do |distro|
    context "on #{distro}" do
      let(:facts) {{
          :osfamily => distro,
        }}

      it { should contain_class('salt::master::install') }
      it { should contain_class('salt::master::config') }
      it { should contain_class('salt::master::service') }
      it { should contain_class('salt::minion::install') }
      it { should contain_class('salt::minion::config') }
      it { should contain_class('salt::minion::service') }

      ##
      ## salt-master config file
      ##
      describe 'config file with default params' do
        it { should contain_file('/etc/salt/master')}
      end

      ##
      ## salt-minion config file
      ##
      describe 'config file with default params' do
        it { should contain_file('/etc/salt/minion')}
      end

      ##
      ## salt-master service
      ##
      describe 'service with default params' do
        it { should contain_service('salt-master').with(
          'ensure'     => 'running',
          'enable'     => 'true',
          'hasstatus'  => 'true',
          'hasrestart' => 'true'
          )}
      end
      ##
      ## salt-minion service
      ##
      describe 'service with default params' do
        it { should contain_service('salt-minion').with(
          'ensure'     => 'running',
          'enable'     => 'true',
          'hasstatus'  => 'true',
          'hasrestart' => 'true'
          )}
      end

      ##
      ## salt::master::install
      ##
      it 'installs the salt-master package' do
        should contain_package('salt-master').with(
        'ensure'   => 'present',
        'name'     => 'salt-master'
        )
      end
      ##
      ## salt::minion::install
      ##
      it 'installs the salt-minion package' do
        should contain_package('salt-minion').with(
        'ensure'   => 'present',
        'name'     => 'salt-minion'
        )
      end
    end
  end
  ['Archlinux', ].each do |distro|
    context "on #{distro}" do
      let(:facts) {{
          :osfamily => distro,
        }}

      it { should contain_class('salt::master::install') }
      it { should contain_class('salt::master::config') }
      it { should contain_class('salt::master::service') }
      it { should contain_class('salt::minion::install') }
      it { should contain_class('salt::minion::config') }
      it { should contain_class('salt::minion::service') }

      ##
      ## salt-master config file
      ##
      describe 'config file with default params' do
        it { should contain_file('/etc/salt/master')}
      end

      ##
      ## salt-minion config file
      ##
      describe 'config file with default params' do
        it { should contain_file('/etc/salt/minion')}
      end

      ##
      ## salt-master service
      ##
      describe 'service with default params' do
        it { should contain_service('salt-master').with(
          'ensure'     => 'running',
          'enable'     => 'true',
          'hasstatus'  => 'true',
          'hasrestart' => 'true'
          )}
      end
      ##
      ## salt-minion service
      ##
      describe 'service with default params' do
        it { should contain_service('salt-minion').with(
          'ensure'     => 'running',
          'enable'     => 'true',
          'hasstatus'  => 'true',
          'hasrestart' => 'true'
          )}
      end
    end
  end
end
