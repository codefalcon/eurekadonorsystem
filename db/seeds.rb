# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = User.find_by_email_address('info@aidindia.in')

if(@user.nil?)
User.create!(:first_name => 'Donor', :last_name => 'Team', :email_address => 'info@aidindia.in', :phone_number => '+91-44-28602308', :gender => 0, :login => 'donor_team', :password => '!Password', :password_confirmation => '!Password', :role => 1, :status => 1)
end
