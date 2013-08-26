class RemoveNgoNameFromVillageinfo < ActiveRecord::Migration

  def change
    remove_column :villageinfos, :ngo_name
  end
end
