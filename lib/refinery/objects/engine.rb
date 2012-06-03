module Refinery
  module Objects
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Objects

      engine_name :refinery_objects

      initializer "register refinerycms_objects plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "objects"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.objects_admin_objects_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/objects/object'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Objects)
      end
    end
  end
end
