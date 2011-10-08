Vagrant::Config.run do |config|
  config.vm.customize do |vm|
    vm.name = "Text-to-Speech"
  end

  config.vm.box = "lucid32"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"
  config.vm.network "33.33.33.11"
  config.vm.forward_port "stomp", 61613, 61613

  config.vm.share_folder "gem-source", "/usr/local/src/bach", "."

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "bach.pp"
  end
end
