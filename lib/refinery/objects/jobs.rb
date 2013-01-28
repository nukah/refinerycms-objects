module Refinery
  module Objects
    class NewObjectJob < Struct.new(:subscribers, :object)
      def perform
        subscribers.each { |e| Refinery::Objects::ObjectMailer.new_object(e, object).deliver }
      end
    end
  end  
end