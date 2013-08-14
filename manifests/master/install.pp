# this class will make sure that the salt-master package is installed
# for archlinux single package it will test if it is allready defined.
class salt::master::install (
  $master_package_ensure = $salt::master::master_package_ensure,
  $master_package_name   = $salt::master::master_package_name,) inherits
salt::master {
  if defined(Package[$salt::master::master_package_name]) == false {
    package { $salt::master::master_package_name: ensure =>
      $salt::master::master_package_ensure, }
  }
}
