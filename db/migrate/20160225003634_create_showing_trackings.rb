class CreateShowingTrackings < ActiveRecord::Migration
  def change
    create_table :showing_trackings do |t|
      t.integer :user_id
      t.string :name
      t.string :street_address
      t.string :city
      t.integer :price
      t.float :bathrooms
      t.integer :bedrooms
      t.integer :design_personality
      t.integer :exterior
      t.integer :general_condition
      t.integer :kitchen
      t.integer :neighborhood
      t.integer :landscaping
      t.integer :square_footage
      t.integer :master_bedroom
      t.integer :commute
      t.integer :home_layout
      t.integer :local_schools
      t.text :notes

      t.timestamps null: false
    end
  end
end
