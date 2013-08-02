class Blockuser < ActiveRecord::Base
  belongs_to :block
  belongs_to :user
end
