module Refinery
  module Objects
    module Admin
      class ObjectsController < ::Refinery::AdminController

        crudify :'refinery/objects/object', :xhr_paging => true

      end
    end
  end
end
