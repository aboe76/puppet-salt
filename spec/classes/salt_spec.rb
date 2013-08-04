require 'spec_helper'

describe 'salt' do

  context 'on unsupported distributions' do
    let(:facts) {{ :osfamily => 'Unsupported' }}

    it 'we fail' do
      expect { subject }.to raise_error(/Unsupported platform: Unsupported/)
    end
  end

  context "On a Debian OS with no package name specified" do
    let(:facts) {{ :osfamily => 'Debian' }}
    it 'includes salt::master' do
      it 'includes salt::master::install' do
        should contain_package('salt').with( { 'name' => 'salt' } )
      end
      it 'includes salt::master::config' do
        should contain_file('/etc/salt/master')
      end
      it 'includes salt::master::service' do
        should contain_service('salt-master').with( { 'name' => 'salt-master' } )
        end
    end
    it 'includes salt::minion' do
      it 'includes salt::minion::install' do
        should contain_package('salt-minion').with( { 'name' => 'salt-minion' } )
      end
      it 'includes salt::minion::config' do
        should contain_file('/etc/salt/minion')
      end
      it 'includes salt::minion::service' do
        should contain_service('salt-minion').with( { 'name' => 'salt-minion' } )
      end
    end
  end

  context "On a RedHat OS with no package name specified" do
    let(:facts) {{ :osfamily => 'Redhat' }}
    it 'includes salt::master' do
      it 'includes salt::master::install' do
        should contain_package('salt').with( { 'name' => 'salt' } )
      end
      it 'includes salt::master::config' do
        should contain_file('/etc/salt/master')
      end
      it 'includes salt::master::service' do
        should contain_service('salt-master').with( { 'name' => 'salt-master' } )
        end
    end
    it 'includes salt::minion' do
      it 'includes salt::minion::install' do
        should contain_package('salt-minion').with( { 'name' => 'salt-minion' } )
      end
      it 'includes salt::minion::config' do
        should contain_file('/etc/salt/minion')
      end
      it 'includes salt::minion::service' do
        should contain_service('salt-minion').with( { 'name' => 'salt-minion' } )
      end
    end
  end
  
  context "On a Archlinux system with no package name specified" do
    let(:facts) {{ :osfamily => 'Archlinux' }}
    it 'includes salt::master' do
      it 'includes salt::master::install' do
        should contain_package('salt').with( { 'name' => 'salt' } )
      end
      it 'includes salt::master::config' do
        should contain_file('/etc/salt/master')
      end
      it 'includes salt::master::service' do
        should contain_service('salt-master').with( { 'name' => 'salt-master' } )
        end
    end
    it 'includes salt::minion' do
      it 'includes salt::minion::install' do
        should contain_package('salt-minion').with( { 'name' => 'salt-minion' } )
      end
      it 'includes salt::minion::config' do
        should contain_file('/etc/salt/minion')
      end
      it 'includes salt::minion::service' do
        should contain_service('salt-minion').with( { 'name' => 'salt-minion' } )
      end
    end
  end
  
  context "On a Suse OS with no package name specified" do
    let(:facts) {{ :osfamily => 'Suse' }}
    it 'includes salt::master' do
      it 'includes salt::master::install' do
        should contain_package('salt').with( { 'name' => 'salt' } )
      end
      it 'includes salt::master::config' do
        should contain_file('/etc/salt/master')
      end
      it 'includes salt::master::service' do
        should contain_service('salt-master').with( { 'name' => 'salt-master' } )
        end
    end
    it 'includes salt::minion' do
      it 'includes salt::minion::install' do
        should contain_package('salt-minion').with( { 'name' => 'salt-minion' } )
      end
      it 'includes salt::minion::config' do
        should contain_file('/etc/salt/minion')
      end
      it 'includes salt::minion::service' do
        should contain_service('salt-minion').with( { 'name' => 'salt-minion' } )
      end
    end
  end
end

end   