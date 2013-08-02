class CreateVillageinfos < ActiveRecord::Migration
  def change
    create_table :villageinfos do |t|
      t.references :village, index: true
      t.integer :funding_status
      t.decimal :total_funding_required, :precision => 12, :scale => 2
      t.integer :initial_cpi
      t.string :ngo_name
      t.date :start_date
      t.date :end_date
      t.integer :status
      t.decimal :local_contributions, :precision => 12, :scale => 2

      t.timestamps
    end
  end
end
