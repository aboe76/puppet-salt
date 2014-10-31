# this class is used to configure the salt master config file
class salt::master::config (
  $master_config_manage         = $salt::master::master_config_manage,
  $master_config                = $salt::master::master_config,
  $master_template              = $salt::master::master_config_template,
  $master_interface             = $salt::master::master_interface,
  $master_ipv6                  = $salt::master::master_ipv6,
  $master_publish_port          = $salt::master::master_publish_port,
  $master_user                  = $salt::master::master_user,
  $master_max_open_files        = $salt::master::master_max_open_files,
  $master_worker_threads        = $salt::master::master_worker_threads,
  $master_ret_port              = $salt::master::master_ret_port,
  $master_pid_file              = $salt::master::master_pid_file,
  $master_root_dir              = $salt::master::master_root_dir,
  $master_pki_dir               = $salt::master::master_pki_dir,
  $master_cachedir              = $salt::master::master_cachedir,
  $master_verify_env            = $salt::master::master_verify_env,
  $master_keep_jobs             = $salt::master::master_keep_jobs,
  $master_timeout               = $salt::master::master_timeout,
  $master_loop_interval         = $salt::master::master_loop_interval,
  $master_output                = $salt::master::master_output,
  $master_show_timeout          = $salt::master::master_show_timeout,
  $master_color                 = $salt::master::master_color,
  $master_strip_colors          = $salt::master::master_strip_colors,
  $master_sock_dir              = $salt::master::master_sock_dir,
  $master_enable_gpu_grains     = $salt::master::master_enable_gpu_grains,
  $master_job_cache             = $salt::master::master_job_cache,
  $master_minion_data_cache     = $salt::master::master_minion_data_cache,
  $master_max_event_size        = $salt::master::master_max_event_size,
  $master_ping_on_rotate        = $salt::master::master_ping_on_rotate,
  $master_preserve_minion_cache = $salt::master::master_preserve_minion_cache,
  $master_con_cache             = $salt::master::master_con_cache,
  # master security:
  $master_open_mode             = $salt::master::master_open_mode,
  $master_auto_accept           = $salt::master::master_auto_accept,
  $master_autosign_timeout      = $salt::master::master_autosign_timeout,
  $master_autosign_file         = $salt::master::master_autosign_file,
  $master_autoreject_file       = $salt::master::master_autoreject_file,
  $master_permissive_pki_access = $salt::master::master_permissive_pki_access,
  $master_token_expire          = $salt::master::master_token_expire,
  $master_file_recv             = $salt::master::master_file_recv,
  $master_file_recv_max_size    = $salt::master::master_file_recv_max_size,
  $master_sign_pub_messages     = $salt::master::master_sign_pub_messages,
  # master module management
  $master_cython_enable         = $salt::master::master_cython_enable,
  # master state system settings
  $master_state_top             = $salt::master::master_state_top,
  $master_external_nodes        = $salt::master::master_external_nodes,
  $master_renderer              = $salt::master::master_renderer,
  $master_failhard              = $salt::master::master_failhard,
  $master_state_verbose         = $salt::master::master_state_verbose,
  $master_state_output          = $salt::master::master_state_output,
  $master_jinja_trim_blocks     = $salt::master::master_jinja_trim_blocks,
  $master_jinja_lstrip_blocks   = $salt::master::master_jinja_lstrip_blocks,
  # master file server settings
  $master_hash_type             = $salt::master::master_hash_type,
  $master_file_buffer_size      = $salt::master::master_file_buffer_size,
  # master logging settings
  $master_log_file              = $salt::master::master_log_file,
  $master_key_logfile           = $salt::master::master_key_logfile,
  $master_log_level             = $salt::master::master_log_level,
  $master_log_level_logfile     = $salt::master::master_log_level_logfile,)
inherits salt::master {
  # installs the master config file defined in salt::params
  file { $master_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($master_template),
    replace => $master_config_manage,
  }

  # todo template the yaml parts in config file
}
