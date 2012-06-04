module Refinery
  module Objects
    class Picture < ActiveRecord::Base

      validates :image_id, :presence => true, :numericality => true
      belongs_to :image, :class_name => '::Refinery::Image', :dependent => :destroy
      belongs_to :object, :class_name => 'Refinery::Objects::Object'
    end
  end
end
