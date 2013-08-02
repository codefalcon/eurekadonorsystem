class CreateDonorvillages < ActiveRecord::Migration
  def change
    create_table :donorvillages do |t|
      t.references :village, index: true
      t.references :user, index: true
      t.date :start_date
      t.date :end_date
      t.decimal :amount_for_village, :precision => 12, :scale => 2
      t.integer :status

      t.timestamps
    end
  end
end
