module Refinery
  module Objects
    class NewObjectJob
      include Sidekiq::Worker
      def perform(subscribers, object)
        subscribers.each { |e| Refinery::Objects::ObjectMailer.new_object(e, object).deliver }
      end
    end
  end
end