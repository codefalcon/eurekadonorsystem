class AddCustomIdsToTables < ActiveRecord::Migration
  def change
    add_column :districts, :district_code, :string 
    add_column :blocks, :block_code, :string
    add_column :villages, :village_code, :string
  end
end
