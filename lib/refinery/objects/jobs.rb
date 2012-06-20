module Refinery
  module Objects
    class NewObjectJob < Struct.new(:subscribers, :object)
      def perform
        subscribers.each { |e| ObjectMailer.new_object(e, object).deliver }
      end
    end
  end  
end