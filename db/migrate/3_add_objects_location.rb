require 'net/http'
require 'nokogiri'

class AddObjectsLocation < ActiveRecord::Migration
  def up
  	add_column :refinery_objects, :location, :string, :default => nil
  	Refinery::Objects::Object.all.each { |object| 
  		position = Refinery::Objects::Util.provide_position(object.address)
  		object.update_attributes(:location => position)
  	}
  end

  def down
  	remove_column :refinery_objects, :location
  end
end