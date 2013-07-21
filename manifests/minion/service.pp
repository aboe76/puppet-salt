class salt::minion::service (
  $minion_service_name   = $salt::minion::minion_service_name,
  $minion_service_ensure = $salt::minion::minion_service_ensure,
  $minion_service_manage = $salt::minion::minion_service_manage,
  $minion_service_enable = $salt::minion::minion_service_enable,) inherits
salt::minion {
  if !($minion_service_ensure in ['running', 'stopped']) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $minion_service_manage == true {
    service { "$minion_service_name":
      ensure     => $minion_service_ensure,
      enable     => $minion_service_enable,
      name       => $minion_service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}
