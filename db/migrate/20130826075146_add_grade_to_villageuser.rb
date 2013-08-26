class AddGradeToVillageuser < ActiveRecord::Migration
  def change
    add_column :villageusers, :grade, :int
  end
end
