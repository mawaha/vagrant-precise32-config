class Precise
	def Precise.configure(config, settings)

		path = "#{File.dirname(__FILE__)}"

		# Every Vagrant virtual environment requires a box to build off of.
		config.vm.box = "hashicorp/precise32"

		settings["scripts"].each do |script|
			config.vm.provision :shell, path: "#{path}/scripts/#{script}"
		end

		# Create a forwarded port mapping which allows access to a specific port
		# within the machine from a port on the host machine. In the example below,
		# accessing "localhost:8080" will access port 80 on the guest machine.
		config.vm.network "forwarded_port", guest: 80, host: 8080 
    	config.vm.network "forwarded_port", guest: 3306, host: 33060 # MySQL
		config.vm.network "forwarded_port", guest: 35729, host: 35729 # LiveReload

		# Register All Of The Configured Shared Folders
		settings["folders"].each do |folder|
			config.vm.synced_folder folder["map"], folder["to"],
				type: folder["type"] ||= nil,
				create: true
		end
	end
end