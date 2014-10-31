# this class will only install the salt master
# example:
# class { 'salt::master': }
#
class salt::master (
  $master_config_manage         = $salt::params::master_config_manage,
  $master_config                = $salt::params::master_config,
  $master_config_template       = $salt::params::master_config_template,
  $master_package_ensure        = $salt::params::master_package_ensure,
  $master_package_name          = $salt::params::master_package_name,
  $master_service_ensure        = $salt::params::master_service_ensure,
  $master_service_enable        = $salt::params::master_service_enable,
  $master_service_manage        = $salt::params::master_service_manage,
  $master_service_name          = $salt::params::master_service_name,
  $master_interface             = $salt::params::master_interface,
  $master_ipv6                  = $salt::params::master_ipv6,
  $master_publish_port          = $salt::params::master_publish_port,
  $master_user                  = $salt::params::master_user,
  $master_max_open_files        = $salt::params::master_max_open_files,
  $master_worker_threads        = $salt::params::master_worker_threads,
  $master_ret_port              = $salt::params::master_ret_port,
  $master_pid_file              = $salt::params::master_pid_file,
  $master_root_dir              = $salt::params::master_root_dir,
  $master_pki_dir               = $salt::params::master_pki_dir,
  $master_cachedir              = $salt::params::master_cachedir,
  $master_verify_env            = $salt::params::master_verify_env,
  $master_keep_jobs             = $salt::params::master_keep_jobs,
  $master_timeout               = $salt::params::master_timeout,
  $master_loop_interval         = $salt::params::master_loop_interval,
  $master_output                = $salt::params::master_output,
  $master_show_timeout          = $salt::params::master_show_timeout,
  $master_color                 = $salt::params::master_color,
  $master_strip_colors          = $salt::params::master_strip_colors,
  $master_sock_dir              = $salt::params::master_sock_dir,
  $master_enable_gpu_grains     = $salt::params::master_enable_gpu_grains,
  $master_job_cache             = $salt::params::master_job_cache,
  $master_minion_data_cache     = $salt::params::master_minion_data_cache,
  $master_max_event_size        = $salt::params::master_max_event_size,
  $master_ping_on_rotate        = $salt::params::master_ping_on_rotate,
  $master_preserve_minion_cache = $salt::params::master_preserve_minion_cache,
  $master_con_cache             = $salt::params::master_con_cache,
  # master security:
  $master_open_mode             = $salt::params::master_open_mode,
  $master_auto_accept           = $salt::params::master_auto_accept,
  $master_autosign_timeout      = $salt::params::master_autosign_timeout,
  $master_autosign_file         = $salt::params::master_autosign_file,
  $master_autoreject_file       = $salt::params::master_autoreject_file,
  $master_permissive_pki_access = $salt::params::master_permissive_pki_access,
  $master_token_expire          = $salt::params::master_token_expire,
  $master_file_recv             = $salt::params::master_file_recv,
  $master_file_recv_max_size    = $salt::params::master_file_recv_max_size,
  $master_sign_pub_messages     = $salt::params::master_sign_pub_messages,
  # master module management
  $master_cython_enable         = $salt::params::master_cython_enable,
  # master state system settings
  $master_state_top             = $salt::params::master_state_top,
  $master_external_nodes        = $salt::params::master_external_nodes,
  $master_renderer              = $salt::params::master_renderer,
  $master_failhard              = $salt::params::master_failhard,
  $master_state_verbose         = $salt::params::master_state_verbose,
  $master_state_output          = $salt::params::master_state_output,
  $master_jinja_trim_blocks     = $salt::params::master_jinja_trim_blocks,
  $master_jinja_lstrip_blocks   = $salt::params::master_jinja_lstrip_blocks,
  # master file server settings
  $master_hash_type             = $salt::params::master_hash_type,
  $master_file_buffer_size      = $salt::params::master_file_buffer_size,
  # master logging settings
  $master_log_file              = $salt::params::master_log_file,
  $master_key_logfile           = $salt::params::master_key_logfile,
  $master_log_level             = $salt::params::master_log_level,
  $master_log_level_logfile     = $salt::params::master_log_level_logfile,)
inherits salt::params {
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
