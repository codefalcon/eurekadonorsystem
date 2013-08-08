class Block < ActiveRecord::Base
  include ApplicationHelper 
  belongs_to :district, foreign_key: "district_id", class_name: "District"
  has_many :blockuser
  validates_length_of :name, within: 2..20, message: "Invalid name"
  validates_presence_of :district_id


  def manager
	Blockuser.find_by_block_id_and_role_and_status(self.id, Role::Project_Manager, Status::Active)
  end 

  def director
	Blockuser.find_by_block_id_and_role_and_status(self.id, Role::Project_Director, Status::Active)
  end 

end
