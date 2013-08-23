class Block < ActiveRecord::Base
  include ApplicationHelper 
  belongs_to :district, foreign_key: "district_id", class_name: "District"
  validates_length_of :name, within: 2..20, message: "Invalid name"
  validates_presence_of :district_id  
  has_one :manager, :class_name => 'Blockuser', :conditions => { :status => Status::Active , :role => Role::Project_Manager }
  accepts_nested_attributes_for :manager, :reject_if => lambda { |a| a[:user_id].nil? }
  has_one :director, :class_name => 'Blockuser', :conditions => { :status => Status::Active , :role => Role::Project_Director }
  accepts_nested_attributes_for :director, :reject_if => lambda { |a| a[:user_id].nil? }
  has_many :trainers, :class_name => 'Blockuser', :conditions => { :status => Status::Active , :role => Role::Block_Trainer }
  accepts_nested_attributes_for :trainers, :reject_if => lambda { |a| a[:user_id].nil? }

end
