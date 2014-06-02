# This class will set all parameters for salt master/minion
class salt::params {
  case $::osfamily {
    'redhat'    : {
      $minion_config_manage = true
      $minion_config = '/etc/salt/minion'
      $minion_config_template = 'salt/minion.erb'
      $minion_package_name = 'salt-minion'
      $minion_package_ensure = 'present'
      $minion_service_name = 'salt-minion'
      $minion_service_ensure = 'running'
      $minion_service_manage = true
      $minion_service_enable = true

      $master_config_manage = true
      $master_config = '/etc/salt/master'
      $master_config_template = 'salt/master.erb'
      $master_package_name = 'salt-master'
      $master_package_ensure = 'present'
      $master_service_name = 'salt-master'
      $master_service_ensure = 'running'
      $master_service_manage = true
      $master_service_enable = true

    }
    'archlinux' : {
      $minion_config_manage = true
      $minion_config = '/etc/salt/minion'
      $minion_config_template = 'salt/minion.erb'
      $minion_package_name = 'salt'
      $minion_package_ensure = 'present'
      $minion_service_name = 'salt-minion'
      $minion_service_ensure = 'running'
      $minion_service_manage = true
      $minion_service_enable = true

      $master_config_manage = true
      $master_config = '/etc/salt/master'
      $master_config_template = 'salt/master.erb'
      $master_package_name = 'salt'
      $master_package_ensure = 'present'
      $master_service_name = 'salt-master'
      $master_service_ensure = 'running'
      $master_service_manage = true
      $master_service_enable = true
    }
    'suse'      : {
      $minion_config_manage = true
      $minion_config = '/etc/salt/minion'
      $minion_config_template = 'salt/minion.erb'
      $minion_package_name = 'salt-minion'
      $minion_package_ensure = 'present'
      $minion_service_name = 'salt-minion'
      $minion_service_ensure = 'running'
      $minion_service_manage = true
      $minion_service_enable = true

      $master_config_manage = true
      $master_config = '/etc/salt/master'
      $master_config_template = 'salt/master.erb'
      $master_package_name = 'salt-master'
      $master_package_ensure = 'present'
      $master_service_name = 'salt-master'
      $master_service_ensure = 'running'
      $master_service_manage = true
      $master_service_enable = true
    }
    'debian'    : {
      $minion_config_manage = true
      $minion_config = '/etc/salt/minion'
      $minion_config_template = 'salt/minion.erb'
      $minion_package_name = 'salt-minion'
      $minion_package_ensure = 'present'
      $minion_service_name = 'salt-minion'
      $minion_service_ensure = 'running'
      $minion_service_manage = true
      $minion_service_enable = true

      $master_config_manage = true
      $master_config = '/etc/salt/master'
      $master_config_template = 'salt/master.erb'
      $master_package_name = 'salt-master'
      $master_package_ensure = 'present'
      $master_service_name = 'salt-master'
      $master_service_ensure = 'running'
      $master_service_manage = true
      $master_service_enable = true
    }
    default     : {
      case $::operatingsystem {
        default : {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }
  ###############################################
  # master defaults:
  ###############################################
  $master_interface = '0.0.0.0'
  $master_ipv6 = false
  $master_publish_port = 4505
  $master_user = 'root'
  $master_max_open_files = 100000
  $master_worker_threads = 5
  $master_ret_port = 4506
  $master_pid_file = '/var/run/salt-master.pid'
  $master_root_dir = '/'
  $master_pki_dir = ' /etc/salt/pki/master'
  $master_cachedir = '/var/cache/salt/master'
  $master_verify_env = true
  $master_keep_jobs = 24
  $master_timeout = 5
  $master_loop_interval = 60
  $master_output = 'nested'
  $master_color = true
  $master_sock_dir = '/var/run/salt/master'
  $master_job_cache = true
  $master_minion_data_cache = true

  # master security:
  $master_open_mode = false
  $master_auto_accept = false
  $master_autosign_file = '/etc/salt/autosign.conf'
  $master_permissive_pki_access = false

  # master module management
  $master_cython_enable = false

  # master state system settings
  $master_state_top = 'top.sls'
  $master_external_nodes = 'None'
  $master_renderer = 'yaml_jinja'
  $master_failhard = false
  $master_state_verbose = true
  $master_state_output = 'full'

  # master file server settings
  $master_hash_type = 'md5'
  $master_file_buffer_size = '1048576'

  # master logging settings
  $master_log_file = '/var/log/salt/master'
  $master_key_logfile = '/var/log/salt/key'
  $master_log_level = 'warning'
  $master_log_level_logfile = 'warning'

  ###############################################
  # minion defaults
  ###############################################
  $minion_master = 'salt'
  $minion_ipv6 = false
  $minion_retry_dns = 30
  $minion_master_port = $master_ret_port
  $minion_user = 'root'
  $minion_pidfile = '/var/run/salt-minion.pid'
  $minion_root_dir = '/'
  $minion_pki_dir = '/etc/salt/pki/minion'
  $minion_id = undef
  $minion_append_domain = undef
  $minion_cachedir = '/var/cache/salt/minion'
  $minion_sock_dir = '/var/run/salt/minion'
  $minion_output = 'nested'
  $minion_color = true
  $minion_acceptance_wait_time = 10
  $minion_loop_interval = 60
  $minion_dns_check = true
  $minion_ipc_mode = 'ipc'
  $minion_tcp_pub_port = 4510
  $minion_tcp_pull_port = 4511

  # minion module management
  $minion_cython_enable = false

  # minion state management settings
  $minion_renderer = 'yaml_jinja'
  $minion_failhard = false
  $minion_autoload_dynamic_modules = true
  $minion_clean_dynamic_modules = true
  $minion_environment = 'None'
  $minion_state_top = 'top.sls'

  # minion security settings
  $minion_open_mode = false
  $minion_permissive_pki_access = false
  $minion_state_verbose = true
  $minion_state_output = 'full'
  $minion_master_finger = ''

  # minion thread settings
  $minion_multiprocessing = true
  
  # File Directory Settings
  $minion_hash_type = md5
  # minion logging settings
  $minion_log_file = '/var/log/salt/minion'
  $minion_key_logfile = '/var/log/salt/key'
  $minion_log_level = 'warning'
  $minion_log_level_logfile = 'warning'

  # minion keepalive settings
  $minion_tcp_keepalive = true
  $minion_tcp_keepalive_idle = 300
  $minion_tcp_keepalive_cnt = '-1'
  $minion_tcp_keepalive_intvl = '-1'

}
