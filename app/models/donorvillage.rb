class Donorvillage < ActiveRecord::Base
  belongs_to :village, foreign_key: "village_id", class_name: "Village"
  belongs_to :user, foreign_key: "user_id", class_name: "User"
  validates_presence_of :user_id
  include ApplicationHelper



end
