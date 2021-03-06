module Refinery
  module Objects
    class Object < Refinery::Core::BaseModel
      self.table_name = 'refinery_objects'
      after_create :send_emails
      #before_save { |record| record.location = Refinery::Objects::Util.provide_position(record.address) }

      attr_accessible :title, :position, :address, :location, :distance, :plan, :description, :space, :plan, :floor, :parking, :parkingcost, :rentcost, :photo_id

      acts_as_indexed :fields => [:title, :address, :distance, :plan, :description]

      validates :title, :presence => true, :uniqueness => true
      validates :rentcost, :address, :photo_id, :presence => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      has_many_page_images

      public

      def parking
        self[:parking] ? ::I18n.t('yes') : ::I18n.t('no')
      end

      private

      def send_emails
        Subscribers.all.each { |s| Refinery::Objects::NewObjectJob.perform_async(s.id, self.id) }
      end
    end
  end
end
