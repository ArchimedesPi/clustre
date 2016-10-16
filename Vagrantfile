LUSTRE_BOXEN = 'bento/centos-7.2'
CLIENT_BOXEN = 'bento/centos-7.2'

Vagrant.configure("2") do |config|
	# turn off the default `. => /vagrant` share
	config.vm.synced_folder ".", "/vagrant", disabled: true

	# preliminary box setup. must run before we can provision the box with Ansible. 
	config.vm.provision "shell", inline: <<-SHELL
		sudo yum -y install epel-release
		sudo yum -y install ansible
	SHELL

	# Lustre *combined* metadata and management server (MGS+MDS)
	config.vm.define 'lus-mg-md0' do |mgmd0|
		mgmd0.vm.box = LUSTRE_BOXEN
		mgmd0.vm.network :private_network, ip: "192.168.143.2"
	end

	# Lustre object storage server (OSS, single OST vbox vdisk)
	config.vm.define 'lus-obj0' do |lo0|
		lo0.vm.box = LUSTRE_BOXEN
		lo0.vm.network :private_network, ip: "192.168.143.3"
	end

	# a Lustre client box, for testing
	config.vm.define 'client0' do |cl0|
		cl0.vm.box = CLIENT_BOXEN
		cl0.vm.network :private_network, type: :dhcp
	end

	config.vm.provision :ansible do |ansible|
		ansible.playbook = 'provisioning/playbook.yml'
		ansible.groups = {
			'lustre-management': ['lus-mg0-md0'],
			'lustre-metadata': ['lus-mg0-md0'],
			'lustre-objectstore': ['lus-oss0'],
			'lustre-client': ['client0']
		}
	end
end
