class Blockuser < ActiveRecord::Base
  belongs_to :block, foreign_key: "block_id", class_name: "Block"
  belongs_to :user, foreign_key: "user_id", class_name: "User"

end
