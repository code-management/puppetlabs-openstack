define openstack::resources::user (
  $password,
  $tenant,
  $email,
  $admin   = false,
  $enabled = true,
) {
# TODO: add domains
# NOTE: tenant is assumed to be created before this. See hiera(openstack::keystone::tenants)
  keystone_user { "${name}":
    ensure   => present,
    enabled  => $enabled,
    password => $password,
    #tenant   => $tenant,
    email    => $email,
  }

# NOTE: tenants are paired with users here
  if $admin == true {
    keystone_user_role { "${name}@${tenant}":
      ensure => present,
      roles  => ['_member_', 'admin'],
    }
  } else {
    keystone_user_role { "${name}@${tenant}":
      ensure => present,
      roles  => ['_member_'],
    }
  }
}
