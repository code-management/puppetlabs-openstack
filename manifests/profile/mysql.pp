# The profile to install an OpenStack specific mysql server
class openstack::profile::mysql(
	$bind_address = 'localhost',
        $max_connections = '1024',
) {

  $management_network = $::openstack::config::network_management

  class { '::mysql::server':
    root_password    => $::openstack::config::mysql_root_password,
    restart          => true,
    override_options => {
      'mysqld' => {
                    #'bind_address'           => $::openstack::config::controller_address_management,
                    'bind_address'           => $bind_address,
                    'default-storage-engine' => 'innodb',
                    'max_connections' => $max_connections,
# TODO: comment this out when we have a proper set of IPs. Until then, avoid
# DNS resolution from preventing mysql client connections
#		    'skip-name-resolve'      => true,
                  }
    }
  }

  class { '::mysql::bindings':
    python_enable => true,
  }

  Service['mysqld'] -> Anchor['database-service']

  class { 'mysql::server::account_security': }

  class { 'mysql::server::backup': 
    backupuser     => 'root',
    backuppassword => $::openstack::config::mysql_root_password,
    backupdir     => '/tmp/backup',
    provider      => 'xtrabackup',
  }
}
