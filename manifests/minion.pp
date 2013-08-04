# this class will only install the salt minion
# example:
# class { 'salt::minion': }
#
class salt::minion (
  $minion_config          = $salt::params::minion_config,
  $minion_config_template = $salt::params::minion_config_template,
  $minion_package_ensure  = $salt::params::minion_package_ensure,
  $minion_package_name    = $salt::params::minion_package_name,
  $minion_service_ensure  = $salt::params::minion_service_ensure,
  $minion_service_enable  = $salt::params::minion_service_enable,
  $minion_service_manage  = $salt::params::minion_service_manage,
  $minion_service_name    = $salt::params::minion_service_name,
  $minion_master          = $salt::params::minion_master,
  $minion_ipv6            = $salt::params::minion_ipv6,
  $minion_retry_dns       = $salt::params::minion_retry_dns,
  $minion_master_port     = $salt::params::minion_master_port,
  $minion_user            = $salt::params::minion_user,
  $minion_pidfile         = $salt::params::minion_pidfile,
  $minion_root_dir        = $salt::params::minion_root_dir,
  $minion_pki_dir         = $salt::params::minion_pki_dir,
  $minion_id              = $salt::params::minion_id,
  $minion_append_domain   = $salt::params::minion_append_domain,
  $minion_cachedir        = $salt::params::minion_cachedir,
  $minion_sock_dir        = $salt::params::minion_sock_dir,
  $minion_output          = $salt::params::minion_output,
  $minion_color           = $salt::params::minion_color,
  $minion_acceptance_wait_time     = $salt::params::minion_acceptance_wait_time,
  $minion_loop_interval   = $salt::params::minion_loop_interval,
  $minion_dns_check       = $salt::params::minion_dns_check,
  $minion_ipc_mode        = $salt::params::minion_ipc_mode,
  $minion_tcp_pub_port    = $salt::params::minion_tcp_pub_port,
  $minion_tcp_pull_port   = $salt::params::minion_tcp_pull_port,
  # minion module management
  $minion_cython_enable   = $salt::params::minion_cython_enable,
  # minion state management settings
  $minion_renderer        = $salt::params::minion_renderer,
  $minion_failhard        = $salt::params::minion_failhard,
  $minion_autoload_dynamic_modules =
  $salt::params::minion_autoload_dynamic_modules,
  $minion_clean_dynamic_modules    =
  $salt::params::minion_clean_dynamic_modules,
  $minion_environment     = $salt::params::minion_environment,
  $minion_state_top       = $salt::params::minion_state_top,
  # minion security settings
  $minion_open_mode       = $salt::params::minion_open_mode,
  $minion_permissive_pki_access    =
  $salt::params::minion_permissive_pki_access,
  $minion_state_verbose   = $salt::params::minion_state_verbose,
  $minion_state_output    = $salt::params::minion_state_output,
  $minion_master_finger   = $salt::params::minion_master_finger,
  # minion thread settings
  $minion_multiprocessing = $salt::params::minion_multiprocessing,
  # minion logging settings
  $minion_log_file        = $salt::params::minion_log_file,
  $minion_key_logfile     = $salt::params::minion_key_logfile,
  $minion_log_level       = $salt::params::minion_log_level,
  $minion_log_level_logfile        = $salt::params::minion_log_level_logfile,
  # minion keepalive settings
  $minion_tcp_keepalive   = $salt::params::minion_tcp_keepalive,
  $minion_tcp_keepalive_idle       = $salt::params::minion_tcp_keepalive_idle,
  $minion_tcp_keepalive_cnt        = $salt::params::minion_tcp_keepalive_cnt,
  $minion_tcp_keepalive_intvl      = $salt::params::minion_tcp_keepalive_intvl,)
inherits salt::params {
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
