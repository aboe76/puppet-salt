# install git packages instead of regular

class { 'salt::minion': minion_package_name => 'salt-minion-git', }
class { 'salt::master': master_package_name => 'salt-master-git', }
