class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :twitter_id
      t.string :name
      t.string :screen_name
      t.string :location
      t.string :description
      t.boolean :geo_enabled
      t.string :profile_image_url
      t.string :favorite_place

      t.timestamps
    end
  end
end
