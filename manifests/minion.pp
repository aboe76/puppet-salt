class salt::minion (
  $minion_config          = $salt::params::minion_config,
  $minion_config_template = $salt::params::minion_config_template,
  $minion_package_ensure  = $salt::params::minion_package_ensure,
  $minion_package_name    = $salt::params::minion_package_name,
  $minion_service_ensure  = $salt::params::minion_service_ensure,
  $minion_service_enable  = $salt::params::minion_service_enable,
  $minion_service_manage  = $salt::params::minion_service_manage,
  $minion_service_name    = $salt::params::minion_service_name,) inherits
salt::params {
  include 'salt::minion::install'
  include 'salt::minion::config'
  include 'salt::minion::service'

  # Anchor this as per #8140 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'salt::minion::begin': }

  anchor { 'salt::minion::end': }

  Anchor['salt::minion::begin'] -> Class['::salt::minion::install'] -> Class['::salt::minion::config'
    ] ~> Class['::salt::minion::service'] -> Anchor['salt::minion::end']

}
