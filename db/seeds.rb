# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
cities	= [
	{:name => "Kathmandu"},
	{:name => "Lalitpur"},
	{:name => "Pokhara"}
]

cities.each	do |attributes|
	City.find_or_initialize_by_name(attributes[:name])
end

mayors	= [
	{:name => "Rob", :city => cities.first},
	{:name => "Bob", :city => cities.last},
]
mayors.each	do |attributes|
	Mayor.find_or_initialize_by_name(attributes[:name]).tap	do |t|
		t.city	= attributes[:city]
		t.save!
	end
end