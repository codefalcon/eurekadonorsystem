class Village < ActiveRecord::Base
  belongs_to :block, foreign_key: "block_id", class_name: "Block"
  include ApplicationHelper  

  has_one :villageinfo, :class_name => 'VillageInfo', :conditions => { :status => Status::Active }

  def trainers
	Villageuser.find_all_by_block_id_and_role_and_status(self.id, Role::Block_Trainer, Status::Active)
  end 

  def teachers
	Villageuser.find_all_by_block_id_and_role_and_status(self.id, Role::Teacher, Status::Active)
  end 
end
