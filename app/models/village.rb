class Village < ActiveRecord::Base
  belongs_to :block

  def trainers
	Villageuser.find_all_by_block_id_and_role_and_status(self.id, Role::Block_Trainer, Status::Active)
  end 

  def teachers
	Villageuser.find_all_by_block_id_and_role_and_status(self.id, Role::Teacher, Status::Active)
  end 
end
