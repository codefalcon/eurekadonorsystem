class Village < ActiveRecord::Base
  belongs_to :block, foreign_key: "block_id", class_name: "Block"
  validates_length_of :name, within: 2..20, message: "Invalid name"
  validates :name, :uniqueness => true
  validates :village_code, :uniqueness => true, :unless => lambda{ |v| v.village_code.empty? } 
  validates_presence_of :block_id
  include ApplicationHelper  

  has_one :trainer, :class_name => 'Villageuser', :conditions => { :status => Status::Active , :role => Role::Block_Trainer }
  accepts_nested_attributes_for :trainer, :reject_if => lambda { |a| a[:user_id].nil? }
  has_one :villageinfo, :class_name => 'Villageinfo', :conditions => { :status => Status::Active }
  accepts_nested_attributes_for :villageinfo

  has_one :teacher_elem, :class_name => 'Villageuser', :conditions => { :status => Status::Active , :role => Role::Teacher, :grade => 1 }
  accepts_nested_attributes_for :teacher_elem, :reject_if => lambda { |a| a[:user_id].nil? }
  has_one :teacher_mid, :class_name => 'Villageuser', :conditions => { :status => Status::Active , :role => Role::Teacher, :grade => 2 }
  accepts_nested_attributes_for :teacher_mid, :reject_if => lambda { |a| a[:user_id].nil? }
  has_one :teacher_high, :class_name => 'Villageuser', :conditions => { :status => Status::Active , :role => Role::Teacher, :grade => 3 }
  accepts_nested_attributes_for :teacher_high, :reject_if => lambda { |a| a[:user_id].nil? }


end
