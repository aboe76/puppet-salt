class salt::minion::install (
  $minion_package_ensure = $salt::minion::minion_package_ensure,
  $minion_package_name   = $salt::minion::minion_package_name,) inherits
salt::minion {
  @package { ["salt", "$minion_package_name",]: ensure => present, }

  if $::osfamily == 'Archlinux' {
    realize Package['salt']
  } else {
    realize Package["$minion_package_name"]
  }
}

