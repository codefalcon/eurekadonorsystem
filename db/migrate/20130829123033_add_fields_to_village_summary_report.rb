class AddFieldsToVillageSummaryReport < ActiveRecord::Migration
  def change
    add_column :villagesummaryreports, :common_program, :boolean
    add_column :villagesummaryreports, :construction, :boolean
    add_column :villagesummaryreports, :additional_program, :string
    add_column :villagesummaryreports, :fees_collected, :decimal, :precision => 12, :scale => 2
  end
end
