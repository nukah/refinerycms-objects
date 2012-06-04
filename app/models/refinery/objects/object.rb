module Refinery
  module Objects
    class Object < Refinery::Core::BaseModel
      self.table_name = 'refinery_objects'

      attr_accessible :title, :position, :address, :distance, :plan, :description, :space, :plan, :floor, :parking, :parkingcost, :rentcost, :photo_id

      acts_as_indexed :fields => [:title, :address, :distance, :plan, :description]

      validates :title, :rentcost, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
      has_many :pictures, :dependent => :destroy
      
      public
      def fields
        return self.attributes.keys.reject! { |f| ['title', 'description', 'rentcost', 'id','photo_id','position', 'created_at', 'updated_at'].include?(f) }
      end


      def parking
        self[:parking] ? 'yes' : 'no'
      end
    end
  end
end
