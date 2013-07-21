class salt::master::service (
  $master_service_name = $salt::master::master_service_name,
  $master_service_ensure = $salt::master::master_service_ensure,
  $master_service_manage = $salt::master::master_service_manage,
  $master_service_enable = $salt::master::master_service_enable,
)inherits salt::master{

  if ! ($master_service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $master_service_manage == true {
    service { "$master_service_name":
      ensure     => $master_service_ensure,
      enable     => $master_service_enable,
      name       => $master_service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }


}
