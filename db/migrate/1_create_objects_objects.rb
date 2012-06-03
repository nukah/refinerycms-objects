class CreateObjectsObjects < ActiveRecord::Migration

  def up
    create_table :refinery_objects do |t|
      t.string :title
      t.string :address
      t.string :distance
      t.float :space
      t.string :plan
      t.string :floor
      t.boolean :parking
      t.integer :parkingcost
      t.integer :rentcost
      t.text :description
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-objects"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/objects/objects"})
    end

    drop_table :refinery_objects

  end

end
