require 'bcrypt'

class User < ActiveRecord::Base
  has_many :block, through: :blockuser
  has_many :village, through: :villageuser
  has_many :donorinfo, through: :donorinfo
  has_secure_password :password_confirmation => nil
  validates :password, :presence => true,  :confirmation => true, :length => {:within => 6..40}, :on => :create
  validates :password, :confirmation => true, :length => { :within => 6..40 }, :on => :update, :unless => lambda{ |user| user.password.blank? }
  validates_format_of :email_address, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, :allow_blank => true
  validates_length_of :login, within: 6..20, message: "Invalid login"
  validates_length_of :first_name, within: 2..20, message: "Invalid first name"
  validates_length_of :last_name, within: 2..20, message: "Invalid last name"
  validates :login, :uniqueness => true
  validates :email_address, :uniqueness => true
  include ApplicationHelper 

  def Role
	user_role = Role.Roles().select { |key, value| value == self.role }
	
	if user_role.nil? 
		return nil 
	else 
		return user_role[0][0] 
	end
  end

  def Status
	user_status = Status.Statuses().select { |key,value| value == self.status }
	
	if user_status.nil? 
	     return nil 
	else 
	     return user_status[0][0] 
	end
  end

  def Gender
	user_gender = Sex.Genders().select { |key,value| value == self.gender }
	
	if user_gender.nil? 
	     return nil 
	else 
	     return user_gender[0][0] 
	end
  end


  def name
  	"#{self.first_name} #{self.last_name}"
  end

end

