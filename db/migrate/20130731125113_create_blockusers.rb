class CreateBlockusers < ActiveRecord::Migration
  def change
    create_table :blockusers do |t|
      t.references :block, index: true
      t.references :user, index: true
      t.integer :role
      t.date :start_date
      t.date :end_date
      t.integer :status

      t.timestamps
    end
  end
end
