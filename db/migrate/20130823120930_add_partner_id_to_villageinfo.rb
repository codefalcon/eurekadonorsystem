class AddPartnerIdToVillageinfo < ActiveRecord::Migration

  def change
    add_reference :villageinfos, :partner, index: true
  end

end
