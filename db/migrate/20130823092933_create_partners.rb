class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :partner_code
      t.integer :status

      t.timestamps
    end
  end
end
