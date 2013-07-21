class salt::master (
  $master_config  = $salt::params::master_config,
  $master_config_template  = $salt::params::master_config_template,
  $master_package_ensure = $salt::params::master_package_ensure,
  $master_package_name   = $salt::params::master_package_name,
  $master_service_ensure = $salt::params::master_service_ensure,
  $master_service_enable = $salt::params::master_service_enable,
  $master_service_manage = $salt::params::master_service_manage,
  $master_service_name = $salt::params::master_service_name,) inherits salt::params {
  include 'salt::master::install'
  include 'salt::master::config'
  include 'salt::master::service'

  # Anchor this as per #8140 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'salt::master::begin': }

  anchor { 'salt::master::end': }

  Anchor['salt::master::begin'] -> Class['::salt::master::install'] -> Class['::salt::master::config'
    ] ~> Class['::salt::master::service'] -> Anchor['salt::master::end']

}
