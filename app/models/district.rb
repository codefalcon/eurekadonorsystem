class District < ActiveRecord::Base
	validates_length_of :name, within: 2..20, message: "Invalid name"
	validates :name, :uniqueness => true
	validates :district_code, :uniqueness => true
end
