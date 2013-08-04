require 'spec_helper' 

describe 'salt', :type => 'class' do 
  context "On a Debian OS with no package name specified" do 
    let :facts do 
      { 
        :osfamily => 'Debian' 
      } 
    end 
    
    it { 
      should contain_package('salt').with( { 'name' => 'salt' } ) 
      should contain_package('salt-master').with( { 'name' => 'salt-master' } )
      should contain_package('salt-minion').with( { 'name' => 'salt-minion' } )
      should contain_service('salt-master').with( { 'name' => 'salt-master' } ) 
      should contain_service('salt-minion').with( { 'name' => 'salt-minion' } )
    } 
  end
  
  context "On a RedHat OS with no package name specified" do 
    let :facts do 
      { 
        :osfamily => 'RedHat' 
      } 
    end 
   
    it { 
      should contain_package('salt').with( { 'name' => 'salt' } ) 
      should contain_package('salt-master').with( { 'name' => 'salt-master' } )
      should contain_package('salt-minion').with( { 'name' => 'salt-minion' } )
      should contain_service('salt-master').with( { 'name' => 'salt-master' } ) 
      should contain_service('salt-minion').with( { 'name' => 'salt-minion' } ) 
    } 
  end
  
  context "On a Archlinux system with no package name specified" do 
    let :facts do 
      { 
        :osfamily => 'Archlinux' 
      } 
    end 
   
    it { 
      should contain_package('salt').with( { 'name' => 'salt' } ) 
      should contain_package('salt-master').with( { 'name' => 'salt-master' } )
      should contain_package('salt-minion').with( { 'name' => 'salt-minion' } )
      should contain_service('salt-master').with( { 'name' => 'salt-master' } ) 
      should contain_service('salt-minion').with( { 'name' => 'salt-minion' } ) 
    } 
  end
  
  context "On a Suse OS with no package name specified" do 
    let :facts do 
      { 
        :osfamily => 'Suse' 
      } 
    end 
   
    it { 
      should contain_package('salt').with( { 'name' => 'salt' } ) 
      should contain_package('salt-master').with( { 'name' => 'salt-master' } )
      should contain_package('salt-minion').with( { 'name' => 'salt-minion' } )
      should contain_service('salt-master').with( { 'name' => 'salt-master' } ) 
      should contain_service('salt-minion').with( { 'name' => 'salt-minion' } ) 
    } 
  end 
  
  context "On an unknown OS with no package name specified" do 
    let :facts do 
      { 
        :osfamily => 'Darwin' 
      } 
    end 
    it {
      expect { should raise_error(Puppet::Error) } 
    } 
  end 
  
  context "With a package name specified" do 
    let :params do 
      { 
        :package_name => 'salt-git' 
      } 
    end 
    
    it { 
      should contain_package('salt-git').with( { 'name' => 'salt-git' } ) 
      should contain_service('salt-master').with( { 'name' => 'salt-master' } ) 
    } 
  end 
end   