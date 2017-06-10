class RemoveDateFromEntities < ActiveRecord::Migration[5.0]
  def change
    remove_column :entities, :created_at
    remove_column :entities, :updated_at
  end
end
