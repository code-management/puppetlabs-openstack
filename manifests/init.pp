# = Puppet Labs OpenStack Parameters
# == Class: openstack
#
# === Authors
#
# Christian Hoge <chris.hoge@puppetlabs.com>
# 
# Modified by Evan Bollig <bollig@gmail.com>
#
# === Copyright
#
# Copyright 2013-2014 Puppet Labs.
#
# Class for configuring the global installation parameters for the puppetlabs-openstack module.
# By default, the module will try to find the parameters in hiera. If the hiera lookup fails,
# it will fall back to the parameters passed to this class. The use of this class is optional,
# and will be automatically included through the configuration. If the ::openstack
# class is used, it needs appear first in node parse order to ensure proper variable
# initialization.
#
# [*region*]
#   The region name to set up the OpenStack services.
#
# == Networks
# [*network_api*]
#   The CIDR of the api network. This is the network that all public
#   api calls are made on, as well as the network to access Horizon.
#
# [*networks*]
#   (optional) Hash of neutron networks. Example:
#     {
#       'public' => {
#         'tenant_name'              => 'services',
#         'provider_network_type'    => 'gre',
#         'router_external'          => true,
#         'provider_segmentation_id' => 3604,
#         'shared'                   => true,
#       }
#     }
#   Consult the neutron_network documentation for more information.
#   Defaults to {}.
#
# [*subnets*]
#   (optional) Hash of neutron subnets. Example:
#     {
#       '192.168.22.0/24' => {
#         'cidr'             => '192.168.22.0/24',
#         'ip_version'       => '4',
#         'gateway_ip'       => '192.168.22.2',
#         'enable_dhcp'      => false,
#         'network_name'     => 'public',
#         'tenant_name'      => 'services',
#         'allocation_pools' => ['start=192.168.22.100,end=192.168.22.200'],
#         'dns_nameservers'  => [192.168.22.2],
#       }
#     }
#   Consult the neutron_subnet documentation for more information.
#   Defaults to {}.
#
# [*routers*]
#   (optional) Hash of neutron routers. Example:
#     {
#       'test' => {
#         'tenant_name'          => 'test',
#         'gateway_network_name' => 'public',
#       }
#     }
#   Consult the neutron_router documentation for more information.
#   Defaults to {}.
#
# [*router_interfaces*]
#   (optional) Hash of neutron router interfaces. The key has the form
#   tenant:subnet where the subnet is one of the subnets given by the
#   $subnets parameter. Example:
#     {
#       'test:10.0.0.0/24' => {
#         ensure => present,
#        }
#     }
#   Consult the neutron_router_interface documentation for more
#   information.
#   Defaults to {}.
#
# [*network_external*]
#   The CIDR of the external network. May be the same as network_api.
#   This is the network that floating IP addresses are allocated in
#   to allow external access to virtual machine instances.
#
# [*network_management*]
#   The CIDR of the management network.
#
# [*network_data*]
#   The CIDR of the data network. May be the same as network_management.
#
# == Fixed IPs (controllers)
# [*controller_address_api*]
#   The API IP address of the controller node. Must be in the network_api CIDR.
#
# [*controller_address_management*]
#   The management IP address of the controller node. Must be in the network_management CIDR.
#
# [*storage_address_api*]
#   The API IP address of the storage node. Must be in the network_api CIDR.
#
# [*storage_address_management*]
#   The management IP address of the storage node. Must be in the network_management CIDR.
#
# == Database
# [*mysql_root_password*]
#   The root password for the MySQL database.
#
# [*mysql_service_password*]
#   The MySQL shared password for all of the OpenStack services.
#
# [*mysql_allowed_hosts*]
#   Array of hosts that are allowed to access the MySQL database. Should include all of the network_management CIDR.
#   Example configuration: ['localhost', '127.0.0.1', '172.16.33.%']
#
# [*mysql_user_keystone*]
#   The database username for keystone service.
#
# [*mysql_pass_keystone*]
#   The database password for keystone service.
#
# [*mysql_user_cinder*]
#   The database username for cinder service.
#
# [*mysql_pass_cinder*]
#   The database password for cinder service.
#
# [*mysql_user_glance*]
#   The database username for glance service.
#
# [*mysql_pass_glance*]
#   The database password for glance service.
#
# [*mysql_user_nova*]
#   The database username for nova service.
#
# [*mysql_pass_nova*]
#   The database password for nova service.
#
# [*mysql_user_neutron*]
#   The database username for neutron service.
#
# [*mysql_pass_neutron*]
#   The database password for neutron service.
#
# [*mysql_user_heat*]
#   The database username for heat service.
#
# [*mysql_pass_heat*]
#   The database password for heat service.
#
# [*mysql_user_aodh*]
#   The database username for aodh service.
#
# [*mysql_pass_aodh*]
#   The database password for aodh service.
#
# [*mysql_user_gnocchi*]
#   The database username for gnocchi service.
#
# [*mysql_pass_gnocchi*]
#   The database password for gnocchi service.
#
# [*mysql_user_trove*]
#   The database username for trove service.
#
# [*mysql_pass_trove*]
#   The database password for trove service.
#
# == RabbitMQ
# [*rabbitmq_hosts*]
#   The host list for the RabbitMQ service.
#
# [*rabbitmq_user*]
#   The username for the RabbitMQ queues.
#
# [*rabbitmq_password*]
#   The password for accessing the RabbitMQ queues.
#
# == Keystone
# [*keystone_admin_token*]
#   The global administrative token for the Keystone service.
#
# [*keystone_admin_email*]
#   The e-mail address of the Keystone administrator.
#
# [*keystone_admin_password*]
#   The password for keystone user in Keystone.
#
# [*keystone_domains*]
#   (optional) The intial keystone domains to create. Should be a Hash in the form of: 
#   {'domain_name1' => { 'description' => 'Domain Description 1'}, 
#    'domain_name2' => {'description' => 'Domain Description 2', 'is_default' => true }}
#
# [*keystone_tenants*]
#   (optional) The intial keystone tenants to create. Should be a Hash in the form of: 
#   {'tenant_name1' => { 'descritpion' => 'Tenant Description 1'}, 
#    'tenant_name2' => {'description' => 'Tenant Description 2'}}
#
# [*keystone_users*]
#   (optional) The intial keystone users to create. Should be a Hash in the form of:
#   {'user1' => {'password' => 'somepass1', 'tenant' => 'some_preexisting_tenant',
#                'email' => 'foo@example.com', 'admin'  =>  'true'},
#   'user2' => {'password' => 'somepass2', 'tenant' => 'some_preexisting_tenant',
#                'email' => 'foo2@example.com', 'admin'  =>  'false'}} 
#
# [*keystone_use_httpd*]
#   Whether to set up an Apache web service with mod_wsgi or to use the default
#   Eventlet service. If false, the default from $keystone::params::service_name
#   will be used, which will be the default Eventlet service. Set to true to
#   configure an Apache web service using mod_wsgi, which is currently the only
#   web service configuration available through the keystone module.
#   Defaults to false.
#
# == Glance
# [*images*]
#  (optional) Hash of glance_images resources. Example:
#    {
#      'Cirros' => {
#        'container_format' => 'bare',
#        'disk_format'      => 'qcow2',
#        'source'           => 'http://download.cirros-cloud.net/0.3.1/cirros-0.3.1-x86_64-disk.img',
#      }
#   }
#  Consult the glance_image documentation for more information.
#
# [*glance_password*]
#   The password for the glance user in Keystone.
#
# [*glance_api_servers*]
#   Array of api servers, with port setting
#   Example configuration: ['172.16.33.4:9292'] 
#
# ==Cinder
# [*cinder_password*]
#   The password for the cinder user in Keystone.
#
# [*cinder_volume_size*]
#   The size of the Cinder loopback storage device. Example: '8G'.
#
# == Swift
# [*swift_password*]
#    The password for the swift user in Keystone.
#
# [*swift_hash_suffix*]
#   The hash suffix for Swift ring communication.
#
# == Nova
# [*nova_libvirt_type*]
#   The type of hypervisor to use for Nova. Typically 'kvm' for
#   hardware accelerated virtualization or 'qemu' for software virtualization.
#
# [*nova_password*]
#   The password for the nova user in Keystone.
#
# == Neutron
# [*neutron_password*]
#   The password for the neutron user in Keystone.
#
# [*neutron_shared_secret*]
#   The shared secret to allow for communication between Neutron and Nova.
#
# [*neutron_core_plugin*]
#   The core_plugin for the neutron service
#
# [*neutron_service_plugins*]
#   The service_plugins for neutron service
#
# [*plumgrid_director_vip*]
#   IP address of the PLUMgrid Director Server
#
# [*plumgrid_username*]
#   PLUMgrid platform username
#
# [*plumgrid_password*]
#   PLUMgrid platform password
#
# [*neutron_tunneling*] (Deprecated)
#   Boolean. Whether to enable Neutron tunneling.
#   Default to true.
#
# [*neutron_tunnel_types*] (Deprecated)
#   Array. Tunnel types to use
#   Defaults to ['gre'],
#
# [*neutron_tenant_network_type*] (Deprecated)
#   Array. Tenant network type.
#   Defaults to ['gre'],
#
# [*neutron_type_drivers*] (Deprecated)
#   Array. Neutron type drivers to use.
#   Defaults to ['gre'],
#
# [*neutron_mechanism_drivers*] (Deprecated)
#   Defaults to ['openvswitch'].
#
# [*neutron_tunnel_id_ranges*] (Deprecated)
#   Neutron tunnel id ranges.
#   Defaults to ['1:1000']
#
# == Ceilometer
# [*ceilometer_address_management*]
#   The management IP address of the ceilometer node. Must be in the network_management CIDR.
#
# [*ceilometer_mongo_username*]
#   The username for the MongoDB Ceilometer user.
#
# [*ceilometer_mongo_password*]
#   The password for the MongoDB Ceilometer user.
#
# [*ceilometer_password*]
#   The password for the ceilometer user in Keystone.
#
# [*ceilometer_meteringsecret*]
#   The shared secret to allow communication betweek Ceilometer and other
#   OpenStack services.
#
# == Heat
# [*heat_password*]
#   The password for the heat user in Keystone.
#
# [*heat_encryption_key*]
#   The encyption key for the shared heat services.
#
# == Horizon
# [*horizon_secret_key*]
#   The secret key for the Horizon service.
#
# [*allowed_hosts*]
#   List of hosts which will be set as value of ALLOWED_HOSTS
#   parameter in settings_local.py. This is used by Django for
#   security reasons. Can be set to * in environments where security is
#   deemed unimportant.
#
# [*server_aliases*]
#   List of names which should be defined as ServerAlias directives
#   in vhost.conf.
#
# == Log levels
# [*verbose*]
#   Boolean. Determines if verbose is enabled for all OpenStack services.
#
# [*debug*]
#   Boolean. Determines if debug is enabled for all OpenStack services.
#
# == Tempest
# [*tempest_configure_images*]
#   Boolean. Whether Tempest should configure images.
#
# [*tempest_image_name*]
#   The name of the primary image to use for tests.
#
# [*tempest_image_name_alt*]
#   The name of the secondary image to use for tests. If the same as the
#   tempest_image_primary, some tests will be disabled.
#
# [*tempest_username*]
#   The login username to run tempest tests.
#
# [*tempest_username_alt*]
#   The alternate login username for tempest tests.
#
# [*tempest_username_admin*]
#   The uername for the Tempest admin user.
#
# [*tempest_configure_network*]
#   Boolean. If Tempest should configure test networks.
#
# [*tempest_public_network_name*]
#   The name of the public neutron network for Tempest to connect to.
#
# [*tempest_cinder_available*]
#   Boolean. If Cinder services are available.
#
# [*tempest_glance_available*]
#   Boolean. If Glance services are available.
#
# [*tempest_horizon_available*]
#   Boolean. If Horizon is available.
#
# [*tempest_nova_available*]
#   Boolean. If Nova services are available.
#
# [*tempest_neutron_available*]
#   Boolean. If Neutron services are availale.
#
# [*tempest_heat_available*]
#   Boolean. If Heat services are available.
#
# [*tempest_swift_available*]
#   Boolean. If Swift services are available.
#
class openstack (
  $use_hiera = true,
  $region = undef,
# Start SSL: use same options Keystone would use
  $insecure_ssl                       = false,
  $enable_ssl                         = false,
  $horizon_ssl_certfile                       = '/etc/horizon/ssl/certs/horizon.pem',
  $horizon_ssl_keyfile                        = '/etc/horizon/ssl/private/horizonkey.pem',
  $keystone_ssl_certfile                       = '/etc/keystone/ssl/certs/keystone.pem',
  $keystone_ssl_keyfile                        = '/etc/keystone/ssl/private/keystonekey.pem',
  $haproxy_ssl_certfile	              = '/etc/haproxy/haproxy.pem',
  $ssl_chainfile                      = '/etc/keystone/ssl/certs/keystone_incommon_chain.pem',
  $ssl_ca_certs                       = '/etc/keystone/ssl/certs/ca.pem',
#  $ssl_ca_key                         = '/etc/keystone/ssl/private/cakey.pem',
#  $ssl_cert_subject                   = '/C=US/ST=Unset/L=Unset/O=Unset/CN=localhost',
#  $signing_certfile                   = '/etc/keystone/ssl/certs/signing_cert.pem',
#  $signing_keyfile                    = '/etc/keystone/ssl/private/signing_key.pem',
#  $signing_ca_certs                   = '/etc/keystone/ssl/certs/ca.pem',
#  $signing_ca_key                     = '/etc/keystone/ssl/private/cakey.pem',
#  $rabbit_use_ssl                     = false,
#  $kombu_ssl_ca_certs                 = undef,
#  $kombu_ssl_certfile                 = undef,
#  $kombu_ssl_keyfile                  = undef,
#  $kombu_ssl_version                  = 'TLSv1',
# End SSL
  $network_api = undef,
  $networks = undef,
  $subnets = undef,
  $routers = undef,
  $router_interfaces = undef,
  $network_external = undef,
  $network_management = undef,
  $network_data = undef,
  $network_external_ippool_start = undef,
  $network_external_ippool_end = undef,
  $network_external_gateway = undef,
  $network_external_dns = undef,
  $network_neutron_private = undef,
  $controller_address_api = undef,
  $controller_address_management = undef,
  $storage_address_api = undef,
  $storage_address_management = undef,
  $mysql_root_password = undef,
  $mysql_service_password = undef,
  $mysql_allowed_hosts = undef,
  $mysql_user_keystone = undef,
  $mysql_pass_keystone = undef,
  $mysql_user_cinder = undef,
  $mysql_pass_cinder = undef,
  $mysql_user_glance = undef,
  $mysql_pass_glance = undef,
  $mysql_user_nova = undef,
  $mysql_pass_nova = undef,
  $mysql_user_neutron = undef,
  $mysql_pass_neutron = undef,
  $mysql_user_heat = undef,
  $mysql_pass_heat = undef,
  $mysql_user_aodh = undef,
  $mysql_pass_aodh = undef,
  $mysql_user_gnocchi = undef,
  $mysql_pass_gnocchi = undef,
  $mysql_user_trove = undef,
  $mysql_pass_trove = undef,
  $rabbitmq_hosts = undef,
  $rabbitmq_user = undef,
  $rabbitmq_password = undef,
  $keystone_admin_token = undef,
  $keystone_admin_email = undef,
  $keystone_admin_password = undef,
  $keystone_domains = undef,
  $keystone_tenants = undef,
  $keystone_users = undef,
  $keystone_use_httpd = false,
  $glance_password = undef,
  $glance_api_servers = undef,
  $images = undef,
  $cinder_password = undef,
  $cinder_volume_size = undef,
  $swift_password = undef,
  $swift_hash_suffix = undef,
  $nova_libvirt_type = undef,
  $nova_password = undef,
  $neutron_password = undef,
  $neutron_shared_secret = undef,
  $neutron_core_plugin = undef,
  $neutron_service_plugins = undef,
  $plumgrid_director_vip = undef,
  $plumgrid_username = undef,
  $plumgrid_password = undef,
  $neutron_tunneling = true,
  $neutron_tunnel_types = ['gre','vxlan'],
  $neutron_tenant_network_type = ['gre'],
  $neutron_type_drivers = ['gre'],
  $neutron_mechanism_drivers = ['openvswitch', 'l2population'],
  $neutron_tunnel_id_ranges = ['1:1000'],
  $ceilometer_address_management = undef,
  $ceilometer_mongo_username = undef,
  $ceilometer_mongo_password = undef,
  $ceilometer_password = undef,
  $ceilometer_meteringsecret = undef,
  $aodh_password = undef,
  $gnocchi_password = undef,
  $trove_password = undef,
  $heat_password = undef,
  $heat_encryption_key = undef,
  $horizon_secret_key = undef,
  $horizon_allowed_hosts = undef,
  $horizon_server_aliases = undef,
  $tempest_configure_images    = undef,
  $tempest_image_name          = undef,
  $tempest_image_name_alt      = undef,
  $tempest_username            = undef,
  $tempest_username_alt        = undef,
  $tempest_username_admin      = undef,
  $tempest_configure_network   = undef,
  $tempest_public_network_name = undef,
  $tempest_cinder_available    = undef,
  $tempest_glance_available    = undef,
  $tempest_horizon_available   = undef,
  $tempest_nova_available      = undef,
  $tempest_neutron_available   = undef,
  $tempest_heat_available      = undef,
  $tempest_swift_available     = undef,
  $verbose = undef,
  $debug = undef,
) {

  if pick(hiera(openstack::security::enable_ssl, false), $enable_ssl) { 
    $http_protocol = 'https'
  } else {
    $http_protocol = 'http'
  }

  if $use_hiera {
    class { '::openstack::config':
      region                        => hiera(openstack::region),
      http_protocol                 => hiera(openstack::security::http_protocol, $http_protocol),
      insecure_ssl                  => pick(hiera(openstack::security::insecure_ssl, false), $insecure_ssl),
      enable_ssl                    => pick(hiera(openstack::security::enable_ssl, false), $enable_ssl),
      horizon_ssl_certfile          => pick(hiera(openstack::security::horizon_ssl_certfile, {}), $horizon_ssl_certfile),
      horizon_ssl_keyfile           => pick(hiera(openstack::security::horizon_ssl_keyfile, {}), $horizon_ssl_keyfile),
      keystone_ssl_certfile         => pick(hiera(openstack::security::keystone_ssl_certfile, {}), $keystone_ssl_certfile),
      keystone_ssl_keyfile          => pick(hiera(openstack::security::keystone_ssl_keyfile, {}), $keystone_ssl_keyfile),
      haproxy_ssl_certfile	    => pick(hiera(openstack::security::haproxy_ssl_certfile, {}), $haproxy_ssl_certfile),
      ssl_chainfile                 => pick(hiera(openstack::security::ssl_chainfile, {}), $ssl_chainfile),
      ssl_ca_certs                  => pick(hiera(openstack::security::ssl_ca_certs, {}), $ssl_ca_certs),
#      ssl_ca_key                    => pick(hiera(openstack::security::ssl_ca_key, {}), $ssl_ca_key),
#      ssl_cert_subject              => pick(hiera(openstack::security::ssl_cert_subject, {}), $ssl_cert_subject),
#      signing_certfile              => pick(hiera(openstack::security::signing_certfile, {}), $signing_certfile),
#      signing_keyfile               => pick(hiera(openstack::security::signing_keyfile, {}), $signing_keyfile),
#      signing_ca_certs              => pick(hiera(openstack::security::signing_ca_certs, {}), $signing_ca_certs),
#      signing_ca_key                => pick(hiera(openstack::security::signing_ca_key, {}), $signing_ca_key),
#      rabbit_use_ssl                => pick(hiera(openstack::security::rabbit_use_ssl, {}), $rabbit_use_ssl),
#      kombu_ssl_ca_certs            => pick(hiera(openstack::security::kombu_ssl_ca_certs, {}), $kombu_ssl_ca_certs),
#      kombu_ssl_certfile            => pick(hiera(openstack::security::kombu_ssl_certfile, {}), $kombu_ssl_certfile),
#      kombu_ssl_keyfile             => pick(hiera(openstack::security::kombu_ssl_keyfile, {}), $kombu_ssl_keyfile),
#      kombu_ssl_version             => pick(hiera(openstack::security::kombu_ssl_version, {}), $kombu_ssl_version),
      network_api                   => hiera(openstack::network::api),
      networks                      => hiera(openstack::networks, {}),
      subnets                       => hiera(openstack::subnets, {}),
      routers                       => hiera(openstack::routers, {}),
      router_interfaces             => hiera(openstack::router_interfaces, {}),
      network_external              => hiera(openstack::network::external),
      network_management            => hiera(openstack::network::management),
      network_data                  => hiera(openstack::network::data),
      controller_address_api        => hiera(openstack::controller::address::api),
      controller_address_management => hiera(openstack::controller::address::management),
      storage_address_api           => hiera(openstack::storage::address::api),
      storage_address_management    => hiera(openstack::storage::address::management),
      mysql_root_password           => hiera(openstack::mysql::root_password),
      mysql_service_password        => hiera(openstack::mysql::service_password),
      mysql_allowed_hosts           => hiera(openstack::mysql::allowed_hosts),
      mysql_user_keystone           => pick(hiera(openstack::mysql::keystone::user, undef), 'keystone'),
      mysql_pass_keystone           => pick(hiera(openstack::mysql::keystone::pass, undef), hiera(openstack::mysql::service_password)),
      mysql_user_cinder             => pick(hiera(openstack::mysql::cinder::user, undef), 'cinder'),
      mysql_pass_cinder             => pick(hiera(openstack::mysql::cinder::pass, undef), hiera(openstack::mysql::service_password)),
      mysql_user_glance             => pick(hiera(openstack::mysql::glance::user, undef), 'glance'),
      mysql_pass_glance             => pick(hiera(openstack::mysql::glance::pass, undef), hiera(openstack::mysql::service_password)),
      mysql_user_nova               => pick(hiera(openstack::mysql::nova::user, undef), 'nova'),
      mysql_pass_nova               => pick(hiera(openstack::mysql::nova::pass, undef), hiera(openstack::mysql::service_password)),
      mysql_user_neutron            => pick(hiera(openstack::mysql::neutron::user, undef), 'neutron'),
      mysql_pass_neutron            => pick(hiera(openstack::mysql::neutron::pass, undef), hiera(openstack::mysql::service_password)),
      mysql_user_heat               => pick(hiera(openstack::mysql::heat::user, undef), 'heat'),
      mysql_pass_heat               => pick(hiera(openstack::mysql::heat::pass, undef), hiera(openstack::mysql::service_password)),
      mysql_user_aodh               => pick(hiera(openstack::mysql::aodh::user, undef), 'aodh'),
      mysql_pass_aodh               => pick(hiera(openstack::mysql::aodh::pass, undef), hiera(openstack::mysql::service_password)),
      mysql_user_gnocchi            => pick(hiera(openstack::mysql::gnocchi::user, undef), 'gnocchi'),
      mysql_pass_gnocchi            => pick(hiera(openstack::mysql::gnocchi::pass, undef), hiera(openstack::mysql::service_password)),
      mysql_user_trove              => pick(hiera(openstack::mysql::trove::user, undef), 'trove'),
      mysql_pass_trove              => pick(hiera(openstack::mysql::trove::pass, undef), hiera(openstack::mysql::service_password)),
      rabbitmq_hosts                => hiera(openstack::rabbitmq::hosts),
      rabbitmq_user                 => hiera(openstack::rabbitmq::user),
      rabbitmq_password             => hiera(openstack::rabbitmq::password),
      keystone_admin_token          => hiera(openstack::keystone::admin_token),
      keystone_admin_email          => hiera(openstack::keystone::admin_email),
      keystone_admin_password       => hiera(openstack::keystone::admin_password),
      keystone_domains              => hiera(openstack::keystone::domains, {}),
      keystone_tenants              => hiera(openstack::keystone::tenants, {}),
      keystone_users                => hiera(openstack::keystone::users, {}),
      keystone_use_httpd            => hiera(openstack::keystone::use_httpd, false),
      glance_password               => hiera(openstack::glance::password),
      glance_api_servers            => hiera(openstack::glance::api_servers),
      images                        => hiera(openstack::images),
      cinder_password               => hiera(openstack::cinder::password),
      cinder_volume_size            => hiera(openstack::cinder::volume_size),
      swift_password                => hiera(openstack::swift::password),
      swift_hash_suffix             => hiera(openstack::swift::hash_suffix),
      nova_libvirt_type             => hiera(openstack::nova::libvirt_type),
      nova_password                 => hiera(openstack::nova::password),
      neutron_password              => hiera(openstack::neutron::password),
      neutron_shared_secret         => hiera(openstack::neutron::shared_secret),
      neutron_core_plugin           => hiera(openstack::neutron::core_plugin),
      neutron_service_plugins       => hiera(openstack::neutron::service_plugins),
      plumgrid_director_vip         => hiera(openstack::neutron::plumgrid_director_vip, undef),
      plumgrid_username             => hiera(openstack::neutron::plumgrid_username, undef),
      plumgrid_password             => hiera(openstack::neutron::plumgrid_password, undef),
      neutron_tunneling             => hiera(openstack::neutron::neutron_tunneling, $neutron_tunneling),
      neutron_tunnel_types          => hiera(openstack::neutron::neutron_tunnel_type, $neutron_tunnel_types),
      neutron_tenant_network_type   => hiera(openstack::neutron::neutron_tenant_network_type, $neutron_tenant_network_type),
      neutron_type_drivers          => hiera(openstack::neutron::neutron_type_drivers, $neutron_type_drivers),
      neutron_mechanism_drivers     => hiera(openstack::neutron::neutron_mechanism_drivers, $neutron_mechanism_drivers),
      neutron_tunnel_id_ranges      => hiera(openstack::neutron::neutron_tunnel_id_ranges, $neutron_tunnel_id_ranges),
      ceilometer_address_management => hiera(openstack::ceilometer::address::management),
      ceilometer_mongo_username     => hiera(openstack::ceilometer::mongo::username),
      ceilometer_mongo_password     => hiera(openstack::ceilometer::mongo::password),
      ceilometer_password           => hiera(openstack::ceilometer::password),
      ceilometer_meteringsecret     => hiera(openstack::ceilometer::meteringsecret),
      aodh_password           	    => hiera(openstack::aodh::password),
      gnocchi_password           	=> hiera(openstack::gnocchi::password),
      trove_password           	    => hiera(openstack::trove::password),
      heat_password                 => hiera(openstack::heat::password),
      heat_encryption_key           => hiera(openstack::heat::encryption_key),
      horizon_secret_key            => hiera(openstack::horizon::secret_key),
      horizon_allowed_hosts         => hiera(openstack::horizon::allowed_hosts, []),
      horizon_server_aliases        => hiera(openstack::horizon::server_aliases, []),
      verbose                       => hiera(openstack::verbose),
      debug                         => hiera(openstack::debug),
      tempest_configure_images      => hiera(openstack::tempest::configure_images),
      tempest_image_name            => hiera(openstack::tempest::image_name),
      tempest_image_name_alt        => hiera(openstack::tempest::image_name_alt),
      tempest_username              => hiera(openstack::tempest::username),
      tempest_username_alt          => hiera(openstack::tempest::username_alt),
      tempest_username_admin        => hiera(openstack::tempest::username_admin),
      tempest_configure_network     => hiera(openstack::tempest::configure_network),
      tempest_public_network_name   => hiera(openstack::tempest::public_network_name),
      tempest_cinder_available      => hiera(openstack::tempest::cinder_available),
      tempest_glance_available      => hiera(openstack::tempest::glance_available),
      tempest_horizon_available     => hiera(openstack::tempest::horizon_available),
      tempest_nova_available        => hiera(openstack::tempest::nova_available),
      tempest_neutron_available     => hiera(openstack::tempest::neutron_available),
      tempest_heat_available        => hiera(openstack::tempest::heat_available),
      tempest_swift_available       => hiera(openstack::tempest::swift_available),
    }
  } else {
    class { '::openstack::config':
      region                        => $region,
      http_protocol                 => $http_protocol,
      insecure_ssl                  => $insecure_ssl,
      enable_ssl                    => $enable_ssl,
      horizon_ssl_certfile          => $horizon_ssl_certfile,
      horizon_ssl_keyfile           => $horizon_ssl_keyfile,
      keystone_ssl_certfile         => $keystone_ssl_certfile,
      keystone_ssl_keyfile          => $keystone_ssl_keyfile,
      ssl_chainfile                 => $ssl_chainfile,
      ssl_ca_certs                  => $ssl_ca_certs,
#      ssl_ca_key                    => $ssl_ca_key,
#      ssl_cert_subject              => $ssl_cert_subject,
#      signing_certfile              => $signing_certfile,
#      signing_keyfile               => $signing_keyfile,
#      signing_ca_certs              => $signing_ca_certs,
#      signing_ca_key                => $signing_ca_key,
#      rabbit_use_ssl                => $rabbit_use_ssl,
#      kombu_ssl_ca_certs            => $kombu_ssl_ca_certs,
#      kombu_ssl_certfile            => $kombu_ssl_certfile,
#      kombu_ssl_keyfile             => $kombu_ssl_keyfile,
#      kombu_ssl_version             => $kombu_ssl_version,
      network_api                   => $network_api,
      networks                      => pick($networks, {}),
      subnets                       => pick($subnets, {}),
      routers                       => pick($routers, {}),
      router_interfaces             => $router_interfaces,
      network_external              => $network_external,
      network_management            => $network_management,
      network_data                  => $network_data,
      network_external_ippool_start => $network_external_ippool_start,
      network_external_ippool_end   => $network_external_ippool_end,
      network_external_gateway      => $network_external_gateway,
      network_external_dns          => $network_external_dns,
      network_neutron_private       => $network_neutron_private,
      controller_address_api        => $controller_address_api,
      controller_address_management => $controller_address_management,
      storage_address_api           => $storage_address_api,
      storage_address_management    => $storage_address_management,
      mysql_root_password           => $mysql_root_password,
      mysql_service_password        => $mysql_service_password,
      mysql_allowed_hosts           => $mysql_allowed_hosts,
      mysql_user_keystone           => pick($mysql_user_keystone, 'keystone'),
      mysql_pass_keystone           => pick($mysql_pass_keystone, $mysql_service_password),
      mysql_user_cinder             => pick($mysql_user_cinder, 'cinder'),
      mysql_pass_cinder             => pick($mysql_pass_cinder, $mysql_service_password),
      mysql_user_glance             => pick($mysql_user_glance, 'glance'),
      mysql_pass_glance             => pick($mysql_pass_glance, $mysql_service_password),
      mysql_user_nova               => pick($mysql_user_nova, 'nova'),
      mysql_pass_nova               => pick($mysql_pass_nova, $mysql_service_password),
      mysql_user_neutron            => pick($mysql_user_neutron, 'neutron'),
      mysql_pass_neutron            => pick($mysql_pass_neutron, $mysql_service_password),
      mysql_user_heat               => pick($mysql_user_heat, 'heat'),
      mysql_pass_heat               => pick($mysql_pass_heat, $mysql_service_password),
      mysql_user_aodh               => pick($mysql_user_aodh, 'aodh'),
      mysql_pass_aodh               => pick($mysql_pass_aodh, $mysql_service_password),
      rabbitmq_hosts                => $rabbitmq_hosts,
      rabbitmq_user                 => $rabbitmq_user,
      rabbitmq_password             => $rabbitmq_password,
      keystone_admin_token          => $keystone_admin_token,
      keystone_admin_email          => $keystone_admin_email,
      keystone_admin_password       => $keystone_admin_password,
      keystone_domains              => pick($keystone_domains, {}),
      keystone_tenants              => pick($keystone_tenants, {}),
      keystone_users                => pick($keystone_users, {}),
      keystone_use_httpd            => $keystone_use_httpd,
      glance_password               => $glance_password,
      glance_api_servers            => $glance_api_servers,
      images                        => $images,
      cinder_password               => $cinder_password,
      cinder_volume_size            => $cinder_volume_size,
      swift_password                => $swift_password,
      swift_hash_suffix             => $swift_hash_suffix,
      nova_libvirt_type             => $nova_libvirt_type,
      nova_password                 => $nova_password,
      neutron_password              => $neutron_password,
      neutron_shared_secret         => $neutron_shared_secret,
      neutron_core_plugin           => $neutron_core_plugin,
      neutron_service_plugins       => $neutron_service_plugins,
      plumgrid_director_vip         => $plumgrid_director_vip,
      plumgrid_username             => $plumgrid_username,
      plumgrid_password             => $plumgrid_password,
      neutron_tunneling             => $neutron_tunneling,
      neutron_tunnel_types          => $neutron_tunnel_types,
      neutron_tenant_network_type   => $neutron_tenant_network_type,
      neutron_type_drivers          => $neutron_type_drivers,
      neutron_mechanism_drivers     => $neutron_mechanism_drivers,
      neutron_tunnel_id_ranges      => $neutron_tunnel_id_ranges,
      ceilometer_address_management => $ceilometer_address_management,
      ceilometer_mongo_username     => $ceilometer_mongo_username,
      ceilometer_mongo_password     => $ceilometer_mongo_password,
      ceilometer_password           => $ceilometer_password,
      ceilometer_meteringsecret     => $ceilometer_meteringsecret,
      aodh_password                 => $aodh_password,
      heat_password                 => $heat_password,
      heat_encryption_key           => $heat_encryption_key,
      horizon_secret_key            => $horizon_secret_key,
      horizon_allowed_hosts         => [],
      horizon_server_aliases        => [],
      verbose                       => $verbose,
      debug                         => $debug,
      tempest_configure_images      => $tempest_configure_images,
      tempest_image_name            => $tempest_image_name,
      tempest_image_name_alt        => $tempest_image_name_alt,
      tempest_username              => $tempest_username,
      tempest_username_alt          => $tempest_username_alt,
      tempest_username_admin        => $tempest_username_admin,
      tempest_configure_network     => $tempest_configure_network,
      tempest_public_network_name   => $tempest_public_network_name,
      tempest_cinder_available      => $tempest_cinder_available,
      tempest_glance_available      => $tempest_glance_available,
      tempest_horizon_available     => $tempest_horizon_available,
      tempest_nova_available        => $tempest_nova_available,
      tempest_neutron_available     => $tempest_neutron_available,
      tempest_heat_available        => $tempest_heat_available,
      tempest_swift_available       => $tempest_swift_available,
    }
  }
}
