require 'refinerycms-core'

module Refinery
  autoload :ObjectsGenerator, 'generators/refinery/objects_generator'

  module Objects
    require 'refinery/objects/engine'
    require 'refinery/objects/jobs'
    autoload :Tab, 'refinery/objects/tabs'

    class << self
      attr_writer :root
      attr_writer :tabs

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end
      
      def tabs
         @tabs ||= []
       end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
