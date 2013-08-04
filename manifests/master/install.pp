class salt::master::install (
  $master_package_ensure = $salt::master::master_package_ensure,
  $master_package_name   = $salt::master::master_package_name,) inherits
salt::master {
  if defined(Package["$salt::master::master_package_name"]) == false {
    package { "$salt::master::master_package_name": ensure =>
      $salt::master::master_package_ensure, }
  }
}

