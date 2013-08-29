class MovePartnerIdToBlock < ActiveRecord::Migration
  def change
	remove_column :villageinfos, :partner_id
	add_reference :blocks, :partner, index: true
  end
end
