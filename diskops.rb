# Note: size is given in MiB.
def create_disk(p, filename, size)
	p.customize ['createhd', '--filename', filename, '--size', size]
end

def attach_disk(p, filename, options=nil)
	options ||= {:ctl => 'SATA Controller', :port => 1, :device => 0, :type => 'hdd'}

	p.customize ['storageattach', :id, '--storagectl', options[:ctl],
		'--port', options[:port], '--device', options[:device],
		'--type', options[:type], '--medium', filename]
end

# just creates the disk if it doesn't exist, mounts it otherwise.
def provision_disk(p, filename, size, attach_options=nil)
	unless File.exist?(filename)
		create_disk(p, filename, size)
	end
	attach_disk(p, filename, attach_options)
end