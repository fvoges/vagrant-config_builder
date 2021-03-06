require 'vagrant/errors'
require 'config_builder/class_registry'

module ConfigBuilder

  module Model

    require 'config_builder/model/base'

    require 'config_builder/model/root'

    require 'config_builder/model/nfs'
    require 'config_builder/model/ssh'
    require 'config_builder/model/winrm'
    #require 'config_builder/model/host'

    require 'config_builder/model/vm'
    require 'config_builder/model/synced_folder'

    def self.generate(hash)
      ConfigBuilder::Model::Root.new_from_hash(hash)
    end

    module Network
      require 'config_builder/model/network/forwarded_port'
      require 'config_builder/model/network/private_network'
      require 'config_builder/model/network/public_network'
    end

    module Provider

      @registry = ConfigBuilder::ClassRegistry.new(:provider)

      def self.new_from_hash(hash)
        @registry.generate(hash)
      end

      def self.register(name, klass)
        @registry.register(name, klass)
      end

      require 'config_builder/model/provider/base'

      require 'config_builder/model/provider/virtualbox'
      require 'config_builder/model/provider/vmware'
      require 'config_builder/model/provider/vmware_fusion'
      require 'config_builder/model/provider/vmware_workstation'
      require 'config_builder/model/provider/libvirt'
      require 'config_builder/model/provider/vsphere'
      require 'config_builder/model/provider/azure'
      require 'config_builder/model/provider/aws'
      require 'config_builder/model/provider/openstack'
      require 'config_builder/model/provider/openstack_plugin'
      require 'config_builder/model/provider/softlayer'
    end

    module Provisioner

      @registry = ConfigBuilder::ClassRegistry.new(:provisioner)

      def self.new_from_hash(hash)
        @registry.generate(hash)
      end

      def self.register(name, klass)
        @registry.register(name, klass)
      end

      require 'config_builder/model/provisioner/base'

      require 'config_builder/model/provisioner/file'
      require 'config_builder/model/provisioner/shell'
      require 'config_builder/model/provisioner/puppet'
      require 'config_builder/model/provisioner/puppet_server'
    end
  end
end
