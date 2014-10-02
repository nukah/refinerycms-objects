require 'sidekiq'
module Refinery
  module Objects
    class NewObjectJob
      include Sidekiq::Worker
      def perform(subscriber, object)
        Refinery::Objects::ObjectMailer.new_object(subscriber, object).deliver
      end
    end
  end
end