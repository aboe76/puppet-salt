require 'spec_helper'

describe 'salt' do

  context 'on unsupported distributions' do
    let(:facts) {{ :osfamily => 'Unsupported' }}

    it 'we fail' do
      expect { subject }.to raise_error(/not supported on an Unsupported/)
    end
  end

  context "On a Debian OS with no package name specified" do
    let(:facts) {{ :osfamily => 'Debian' }}
    it 'includes salt::master' do
      should contain_package('salt').with( { 'name' => 'salt' } )
      should contain_package('salt-master').with( { 'name' => 'salt-master' } )
      should contain_service('salt-master').with( { 'name' => 'salt-master' } )
    end
    it 'includes salt::minion' do
      should contain_package('salt-minion').with( { 'name' => 'salt-minion' } )
      should contain_service('salt-minion').with( { 'name' => 'salt-minion' } )
    end
  end

  context "On a RedHat OS with no package name specified" do
    let(:facts) {{ :osfamily => 'Redhat' }}
    it 'includes salt::master' do
      should contain_package('salt').with( { 'name' => 'salt' } )
      should contain_package('salt-master').with( { 'name' => 'salt-master' } )
      should contain_service('salt-master').with( { 'name' => 'salt-master' } )
    end
    it 'includes salt::minion' do
      should contain_package('salt-minion').with( { 'name' => 'salt-minion' } )
      should contain_service('salt-minion').with( { 'name' => 'salt-minion' } )
    end
  end

  context "On a Archlinux system with no package name specified" do
    let(:facts) {{ :osfamily => 'Archlinux' }}
    it 'includes salt::master' do
      should contain_package('salt').with( { 'name' => 'salt' } )
      should contain_package('salt-master').with( { 'name' => 'salt-master' } )
      should contain_service('salt-master').with( { 'name' => 'salt-master' } )
    end
    it 'includes salt::minion' do
      should contain_package('salt-minion').with( { 'name' => 'salt-minion' } )
      should contain_service('salt-minion').with( { 'name' => 'salt-minion' } )
    end
  end

  context "On a Suse OS with no package name specified" do
    let(:facts) {{ :osfamily => 'Suse' }}
    it 'includes salt::master' do
      should contain_package('salt').with( { 'name' => 'salt' } )
      should contain_package('salt-master').with( { 'name' => 'salt-master' } )
      should contain_service('salt-master').with( { 'name' => 'salt-master' } )
    end
    it 'includes salt::minion' do
      should contain_package('salt-minion').with( { 'name' => 'salt-minion' } )
      should contain_service('salt-minion').with( { 'name' => 'salt-minion' } )
    end
  end

end   