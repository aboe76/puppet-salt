class salt::minion::install (
  $minion_package_ensure = $salt::minion::minion_package_ensure,
  $minion_package_name   = $salt::minion::minion_package_name,
) inherits salt::minion {

  package { '$minion_package_name':
    ensure => $minion_package_ensure,
  }

}

