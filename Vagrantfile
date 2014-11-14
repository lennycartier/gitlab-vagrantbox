Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "./", "/vagrant", id: "vagrant-root"

  config.vm.provider "virtualbox" do |v|
  	v.cpus = 2
	v.memory = 1024
  end  

  config.vm.network :forwarded_port, guest:10800, host:1337 

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.options = ['--verbose']
  end

end
