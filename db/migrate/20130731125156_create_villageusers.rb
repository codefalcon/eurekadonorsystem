class CreateVillageusers < ActiveRecord::Migration
  def change
    create_table :villageusers do |t|
      t.references :village, index: true
      t.references :user, index: true
      t.integer :role
      t.date :start_date
      t.date :end_date
      t.integer :status

      t.timestamps
    end
  end
end
