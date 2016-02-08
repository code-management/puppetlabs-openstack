#!/bin/bash
# Mount the openstack module on the Puppet Master
vagrant ssh puppet -c "sudo ln -s /openstack/examples/hiera.yaml /etc/puppet/hiera.yaml; \
sudo mkdir -p /etc/puppet/hieradata; \
sudo ln -s /openstack/examples/common.yaml /etc/puppet/hieradata/common.yaml; \
sudo ln -sf /vagrant/site.pp /etc/puppet/manifests/site.pp; \
cd /opt && sudo git clone https://github.com/bollig/puppetlabs-openstack.git -b liberty; \
cd /opt/puppetlabs-openstack && sudo git pull origin liberty; \
cd /opt/puppetlabs-openstack && sudo puppet module build; \
sudo rm -r /etc/puppet/modules/*; \
cd /opt/puppetlabs-openstack/pkg && sudo puppet module install ./puppetlabs-openstack*.tar.gz; \
sudo service puppetmaster restart; \
sudo puppet agent -t;"


#sudo ln -s /openstack /etc/puppet/modules; \
