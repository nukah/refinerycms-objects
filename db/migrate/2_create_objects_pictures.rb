class CreateObjectsPictures < ActiveRecord::Migration
  def change
    create_table :refinery_pictures do |t|
      t.integer :image_id, :null => false
      t.integer :object_id
      
      t.timestamps
    end
  end
end
