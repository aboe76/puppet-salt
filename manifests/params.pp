class salt::params {
  $minion_config = '/etc/salt/minion'
  $minion_config_template = 'salt/minion.erb'
  $minion_package_name = 'salt-minion'
  $minion_package_ensure = 'present'
  $minion_service_name = 'salt-minion'
  $minion_service_ensure = 'running'
  $minion_service_manage = true
  $minion_service_enable = true


  $master_config = '/etc/salt/master'
  $master_config_template = 'salt/master.erb'
  $master_package_name = 'salt-master'
  $master_package_ensure = 'present'
  $master_service_name = 'salt-master'
  $master_service_ensure = 'running'
  $master_service_manage = true
  $master_service_enable = true
}
