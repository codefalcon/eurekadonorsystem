require 'bcrypt'

class User < ActiveRecord::Base
  has_many :block, through: :blockuser
  has_many :village, through: :villageuser
  has_secure_password :password_confirmation => nil
  validates :password, :presence => true,  :confirmation => true, :length => {:within => 6..40}, :on => :create
  validates :password, :confirmation => true, :length => { :within => 6..40 }, :on => :update, :unless => lambda{ |user| user.password.blank? }
  validates_format_of :email_address, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, :on => :create
  validates_length_of :login, within: 6..20, too_long: 'pick a shorter name', too_short: 'pick a longer name'
  validates_length_of :first_name, within: 2..20, message: "Invalid first name"
  validates_length_of :last_name, within: 2..20, message: "Invalid last name"
  validates :login, :uniqueness => true
  validates :email_address, :uniqueness => true
  include ApplicationHelper 

  def self.RoleName(role)
	rl = Role.Roles().select { |k, v| v == role }
	
	if rl.nil? 
		return nil 
	else 
		return rl[0][0] 
	end
  end

  def self.StatusName(status)
	st = Status.Statuses().select { |k,v| v == status }
	
	if st.nil? 
	     return nil 
	else 
	     return st[0][0] 
	end
  end

  def self.GenderName(gender)
	g = Gender.Genders().select { |k,v| v == gender }
	
	if g.nil? 
	     return nil 
	else 
	     return g[0][0] 
	end
  end


  def name
  	"#{self.first_name} #{self.last_name}"
  end

end

