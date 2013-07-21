class salt::master::config (
  $master_config = $salt::master::master_config,
  $master_template = $salt::master::master_config_template,
)inherits salt::master{

  file { $master_config:
    ensure => file,
    owner => 0,
    group => 0,
    mode  => '0664',
    content => template($master_template),
    replace => false,
  }

# todo parameterize configuration files

}
