class Block < ActiveRecord::Base
  include ApplicationHelper 
  belongs_to :district, foreign_key: "district_id", class_name: "District"
  # has_one :manager, through: :blockuser, :conditions => { :role => Role::Project_Manager, :status => Status::Active }
  # has_one :director, through: :blockuser, :conditions => { :role => Role::Project_Director, :status => Status::Active }
  validates_length_of :name, within: 2..20, message: "Invalid name"
  validates_presence_of :district_id

end
