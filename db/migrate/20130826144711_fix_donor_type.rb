class FixDonorType < ActiveRecord::Migration
  def change
    rename_column :donorinfos, :type, :donor_type
  end
end
