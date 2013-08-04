# this class is used to configure the salt minion config file
class salt::minion::config (
  $minion_config    = $salt::minion::minion_config,
  $minion_template  = $salt::minion::minion_config_template,
  $minion_master    = $salt::minion::minion_master,
  $minion_ipv6      = $salt::minion::minion_ipv6,
  $minion_retry_dns = $salt::minion::minion_retry_dns,
  $minion_master_port              = $salt::minion::minion_master_port,
  $minion_user      = $salt::minion::minion_user,
  $minion_pidfile   = $salt::minion::minion_pidfile,
  $minion_root_dir  = $salt::minion::minion_root_dir,
  $minion_pki_dir   = $salt::minion::minion_pki_dir,
  $minion_id        = $salt::minion::minion_id,
  $minion_append_domain            = $salt::minion::minion_append_domain,
  $minion_cachedir  = $salt::minion::minion_cachedir,
  $minion_sock_dir  = $salt::minion::minion_sock_dir,
  $minion_output    = $salt::minion::minion_output,
  $minion_color     = $salt::minion::minion_color,
  $minion_acceptance_wait_time     = $salt::minion::minion_acceptance_wait_time,
  $minion_loop_interval            = $salt::minion::minion_loop_interval,
  $minion_dns_check = $salt::minion::minion_dns_check,
  $minion_ipc_mode  = $salt::minion::minion_ipc_mode,
  $minion_tcp_pub_port             = $salt::minion::minion_tcp_pub_port,
  $minion_tcp_pull_port            = $salt::minion::minion_tcp_pull_port,
  # minion module management
  $minion_cython_enable            = $salt::minion::minion_cython_enable,
  # minion state management settings
  $minion_renderer  = $salt::minion::minion_renderer,
  $minion_failhard  = $salt::minion::minion_failhard,
  $minion_autoload_dynamic_modules =
  $salt::minion::minion_autoload_dynamic_modules,
  $minion_clean_dynamic_modules    =
  $salt::minion::minion_clean_dynamic_modules,
  $minion_environment              = $salt::minion::minion_environment,
  $minion_state_top = $salt::minion::minion_state_top,
  # minion security settings
  $minion_open_mode = $salt::minion::minion_open_mode,
  $minion_permissive_pki_access    =
  $salt::minion::minion_permissive_pki_access,
  $minion_state_verbose            = $salt::minion::minion_state_verbose,
  $minion_state_output             = $salt::minion::minion_state_output,
  $minion_master_finger            = $salt::minion::minion_master_finger,
  # minion thread settings
  $minion_multiprocessing          = $salt::minion::minion_multiprocessing,
  # minion logging settings
  $minion_log_file  = $salt::minion::minion_log_file,
  $minion_key_logfile              = $salt::minion::minion_key_logfile,
  $minion_log_level = $salt::minion::minion_log_level,
  $minion_log_level_logfile        = $salt::minion::minion_log_level_logfile,
  # minion keepalive settings
  $minion_tcp_keepalive            = $salt::minion::minion_tcp_keepalive,
  $minion_tcp_keepalive_idle       = $salt::minion::minion_tcp_keepalive_idle,
  $minion_tcp_keepalive_cnt        = $salt::minion::minion_tcp_keepalive_cnt,
  $minion_tcp_keepalive_intvl      = $salt::minion::minion_tcp_keepalive_intvl,)
inherits salt::minion {
  # installs the master config file defined in salt::params
  file { $minion_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($minion_template),
    replace => false,
  }

  # todo template the yaml parts in config file
}
