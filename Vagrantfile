VAGRANTFILE_API_VERSION = "2"

path = "#{File.dirname(__FILE__)}"

require 'yaml'
require path + '/bootstrap/precise.rb'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  Precise.configure(config, YAML::load(File.read(path + '/precise.yaml')))
end