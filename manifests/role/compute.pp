class openstack::role::compute inherits ::openstack::role {
  class { '::openstack::profile::neutron::agent': }
  class { '::openstack::profile::nova::compute': }
  class { '::openstack::profile::ceilometer::agent': }
  class { '::openstack::profile::neutron::compute_dvr': }
}
