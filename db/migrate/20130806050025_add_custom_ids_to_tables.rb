class AddCustomIdsToTables < ActiveRecord::Migration
  def change
    add_column :districts, :district_id, :string 
    add_column :blocks, :block_id, :string
    add_column :villages, :village_id, :string
  end
end
