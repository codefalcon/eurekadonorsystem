class Blockuser < ActiveRecord::Base
  belongs_to :block, foreign_key: "block_id", class_name: "Block"
  belongs_to :user, foreign_key: "user_id", class_name: "User"
  validates_presence_of :user_id
  include ApplicationHelper

  def villageusers
     @villages = Village.find_all_by_block_id_and_status(self.block_id, Status::Active, :select => "id").map(&:id)

     Villageuser.find_all_by_village_id_and_user_id_and_status(@villages, self.user_id, Status::Active)
  end

end
