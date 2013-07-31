class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :districtIdentifier
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
