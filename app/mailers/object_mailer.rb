# encoding: utf-8
module Refinery
  module Objects
    class ObjectMailer < ActionMailer::Base
      
      def new_object(subscriber, object)
        @subscriber = subscriber
        @object = object
        
        mail(:to => @subscriber.email) do |format|
          format.text { render :locals => { :object => @object, :subscriber => @subscriber } }
        end
      end
    end
  end
end
