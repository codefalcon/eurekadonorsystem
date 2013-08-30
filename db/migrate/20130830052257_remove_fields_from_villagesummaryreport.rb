class RemoveFieldsFromVillagesummaryreport < ActiveRecord::Migration
  def change
	remove_column :villagesummaryreports, :common_program
	remove_column :villagesummaryreports, :construction
	remove_column :villagesummaryreports, :additional_program
	add_column :villages, :construction, :boolean
        add_column :villages, :additional_program, :string
  end
end
