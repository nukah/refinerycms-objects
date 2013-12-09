class AddFieldToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :name, :string, :default => nil
  end
end
