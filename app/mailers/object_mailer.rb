# encoding: utf-8
class ObjectMailer < ActionMailer::Base
  
  def new_object(subscriber, object)
    @subscriber = subscriber
    @object = object
    
    mail(:to => @subscriber.email) do |format|
      format.html { render :locals => { :object => @object, :subscriber => @subscriber } }
    end
  end
end
