module Refinery
  module Objects
    class Object < Refinery::Core::BaseModel
      self.table_name = 'refinery_objects'

      attr_accessible :title, :position, :address, :distance, :plan, :description, :space, :plan, :floor, :parking, :parkingcost, :rentcost, :photo_id

      acts_as_indexed :fields => [:title, :address, :distance, :plan, :description]

      validates :title, :presence => true, :uniqueness => true
      validates :rentcost, :address, :presence => true

      belongs_to :photo, :class_name => '::Refinery::Image'
      
      has_many_page_images
      
      public
      def fields
        return self.attributes.keys.reject! { |f| ['title', 'description', 'rentcost', 'id','photo_id','position', 'created_at', 'updated_at'].include?(f) }
      end


      def parking
        self[:parking] ? ::I18n.t('yes') : ::I18n.t('no')
      end
      
      def rentcost
        number_to_currency(self[:rentcost], :format => '%n', :precision => 0).insert(-1, ::I18n.t('nds_inc'))
      end
    end
  end
end
