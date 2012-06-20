module Refinery
  module Objects
    module Admin
      class ObjectsController < ::Refinery::AdminController

        crudify :'refinery/objects/object', :xhr_paging => true
        
        def successful_create
          Delayed::Job.enqueue NewObjectJob.new(Subscriber.find(:all), @object)
          super
        end
        
      end
    end
  end
end
