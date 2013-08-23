class Villageinfo < ActiveRecord::Base
  belongs_to :village, foreign_key: "village_id", class_name: "Village"
end
