class CreateDonorinfos < ActiveRecord::Migration
  def change
    create_table :donorinfos do |t|
      t.references :user, index: true
      t.integer :type
      t.decimal :amount_donated, :precision => 12, :scale => 2
      t.decimal :amount_used, :precision => 12, :scale => 2
      t.date :start_date
      t.date :end_date
      t.integer :status

      t.timestamps
    end
  end
end
