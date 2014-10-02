require 'sidekiq'
module Refinery
  module Objects
    class NewObjectJob
      include Sidekiq::Worker
      def perform(subscriber, object)
        Refinery::Objects::ObjectMailer.new_object(Subscriber.find(subscriber), Refinery::Objects::Object.find(object)).deliver
      end
    end
  end
end