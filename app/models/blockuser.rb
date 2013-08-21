class Blockuser < ActiveRecord::Base
  belongs_to :block, foreign_key: "block_id", class_name: "Block"
  belongs_to :user, foreign_key: "user_id", class_name: "User"
  validates_presence_of :user_id

  has_many :villageuser

  def villageusers
     @villages = Village.find_all_by_block_id(self.block_id)

     Villageuser.find_all_by_user_id(self.user_id) #.select { |c| @villages.include?(c.village_id) }
  end

end
