class salt::minion::config (
  $minion_config = $salt::minion::minion_config,
  $minion_template = $salt::minion::minion_config_template,
)inherits salt::minion{

  file { $minion_config:
    ensure => file,
    owner => 0,
    group => 0,
    mode  => '0664',
    content => template($minion_template),
    replace => false,
  }

# todo parameterize configuration files

}
