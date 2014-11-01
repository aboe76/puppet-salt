# this class is used to configure the salt minion config file
class salt::minion::config (
  $minion_config_manage            = $salt::minion::minion_config_manage,
  $minion_config    = $salt::minion::minion_config,
  $minion_template  = $salt::minion::minion_config_template,
  $minion_master    = $salt::minion::minion_master,
  $minion_random_master   = $salt::minion::minion_random_master,
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
  $minion_verify_env       = $salt::minion::minion_verify_env,
  $minion_cache_jobs       = $salt::minion::minion_cache_jobs,
  $minion_sock_dir  = $salt::minion::minion_sock_dir,
  $minion_output    = $salt::minion::minion_output,
  $minion_color     = $salt::minion::minion_color,
  $minion_strip_colors    = $salt::minion::minion_strip_colors,
  $minion_acceptance_wait_time_max = $salt::minion::minion_acceptance_wait_time_max,
  $minion_acceptance_wait_time     = $salt::minion::minion_acceptance_wait_time,
  $minion_rejected_retry  = $salt::minion::minion_rejected_retry,
  $minion_random_reauth_delay      = $salt::minion::minion_random_reauth_delay,
  $minion_auth_timeout    = $salt::minion::minion_auth_timeout,
  $minion_auth_tries      = $salt::minion::minion_auth_tries,
  $minion_auth_safemode   = $salt::minion::minion_auth_safemode,
  $minion_ping_interval   = $salt::minion::minion_ping_interval,
  $minion_recon_default    = $salt::minion::minion_recon_default,
  $minion_recon_max        = $salt::minion::minion_recon_max,
  $minion_recon_randomize  = $salt::minion::minion_recon_randomize,
  $minion_loop_interval            = $salt::minion::minion_loop_interval,
  $minion_dns_check = $salt::minion::minion_dns_check,
  $minion_grains_refresh_every     = $salt::minion::minion_grains_refresh_every,
  $minion_grains_cache    = $salt::minion::minion_grains_cache,
  $minion_grains_cache_expiration  = $salt::minion::minion_grains_cache_expiration,
  $minion_ipc_mode  = $salt::minion::minion_ipc_mode,
  $minion_tcp_pub_port             = $salt::minion::minion_tcp_pub_port,
  $minion_tcp_pull_port            = $salt::minion::minion_tcp_pull_port,
  $minion_max_event_size  = $salt::minion::minion_max_event_size,
  $minion_master_alive_interval    = $salt::minion::minion_master_alive_interval,
  # minion module management
  $minion_cython_enable            = $salt::minion::minion_cython_enable,
  $minion_modules_max_memory       = $salt::minion::minion_modules_max_memory,
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
  # minion file server settings
  $minion_hash_type = $salt::minion::minion_hash_type,
  $minion_fileserver_limit_traversal        = $salt::minion::minion_fileserver_limit_traversal,
  $minion_state_output_diff        = $salt::minion::minion_state_output_diff,
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
    replace => $minion_config_manage,
  }

  # todo template the yaml parts in config file
}
