class AddNumberOfVisitsTodonorvillages < ActiveRecord::Migration
  def change
    add_column :donorvillages, :num_of_donor_visits, :integer
  end
end
