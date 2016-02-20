# Common class for neutron installation
# Private, and should not be used on its own
# Sets up configuration common to all neutron nodes.
# Flags install individual services as needed
# This follows the suggest deployment from the neutron Administrator Guide.
class openstack::common::neutron {

# What it does: https://access.redhat.com/solutions/53031
# See http://www.server-world.info/en/note?os=CentOS_7&p=openstack_liberty&f=13
  #::sysctl::value { 'net.ipv4.conf.default.rp_filter':
    #value     => '0',
  #}
  #::sysctl::value { 'net.ipv4.conf.all.rp_filter':
  #  value     => '0',
  #}


  $is_controller = $::openstack::profile::base::is_controller

  $controller_management_address = $::openstack::config::controller_address_management

  $data_network = $::openstack::config::network_data
  $data_address = ip_for_network($data_network)

  # neutron auth depends upon a keystone configuration
  include ::openstack::common::keystone
  include ::vswitch::ovs


# Base Neutron config. No server, no agents. 
  class { '::neutron':
    rabbit_host           => $controller_management_address,
    core_plugin           => $::openstack::config::neutron_core_plugin,
    allow_overlapping_ips => true,
    rabbit_user           => $::openstack::config::rabbitmq_user,
    rabbit_password       => $::openstack::config::rabbitmq_password,
    rabbit_hosts          => $::openstack::config::rabbitmq_hosts,
    debug                 => $::openstack::config::debug,
    verbose               => $::openstack::config::verbose,
    service_plugins       => $::openstack::config::neutron_service_plugins,
  }

# Base Neutron authentication config (pointing to Keystone)
  class { '::neutron::keystone::auth':
    password         => $::openstack::config::neutron_password,
    public_url       => "http://${::openstack::config::controller_address_api}:9696",
    admin_url        => "http://${::openstack::config::controller_address_management}:9696",
    internal_url     => "http://${::openstack::config::controller_address_management}:9696",
    region           => $::openstack::config::region,
  }

  #if $::osfamily == 'redhat' {
  #  package { 'iproute':
  #      ensure => latest,
  #      before => Class['::neutron']
  #  }
  #}
}
