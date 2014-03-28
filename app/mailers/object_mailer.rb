# encoding: utf-8
module Refinery
  module Objects
    class ObjectMailer < ActionMailer::Base

      def new_object(subscriber, object)
        @subscriber = subscriber
        @object = object

        mail(:to => @subscriber.email, :from => 'info@ros-arenda.rf', :subject => 'Новый объект') do |format|
          format.html { render :locals => { :object => @object, :subscriber => @subscriber } }
        end
      end
    end
  end
end
