class CreateVillagesummaryreports < ActiveRecord::Migration
  def change
    create_table :villagesummaryreports do |t|
      t.references :village, index: true
      t.integer :children_enrolled
      t.integer :children_attended
      t.integer :class_working_days
      t.integer :current_cpi
      t.string :activities_html
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
