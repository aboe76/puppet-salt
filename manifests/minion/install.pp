class salt::minion::install (
  $minion_package_ensure = $salt::minion::minion_package_ensure,
  $minion_package_name   = $salt::minion::minion_package_name,) inherits
salt::minion {
  if defined(Package["${salt::minion::minion_package_name}"]) == false {
    package { "${salt::minion::minion_package_name}": ensure =>
      $salt::minion::minion_package_ensure, }

  }

}

