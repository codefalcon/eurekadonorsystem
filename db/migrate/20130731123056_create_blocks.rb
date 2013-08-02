class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :name
      t.integer :status
      t.references :district, index: true

      t.timestamps
    end
  end
end
