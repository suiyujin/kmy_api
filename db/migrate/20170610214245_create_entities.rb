class CreateEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :entities do |t|
      t.string :tweet_id
      t.string :type
      t.text :text

      t.timestamps
    end
    add_index :entities, :tweet_id
  end
end
