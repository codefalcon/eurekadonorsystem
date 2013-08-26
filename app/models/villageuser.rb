class Villageuser < ActiveRecord::Base
  belongs_to :village
  belongs_to :user, foreign_key: "user_id", class_name: "User"
  validates_presence_of :user_id
  include ApplicationHelper


end
