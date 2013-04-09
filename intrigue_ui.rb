#require './spec/spec_helper'
require 'pg'
require 'active_record'
require './app/models/faction'
my_yaml = YAML::load(File.open('./config/database.yml'))
yaml_development = my_yaml["development"]
ActiveRecord::Base.establish_connection(yaml_development)
DB = PG.connect(:dbname => 'intrigue_development')
DB.exec("DELETE FROM factions *;")

# def cli
#   puts "Type 'builder' to enter the builder, 'intrigue' to start the prototype."
#   input = nil
#   until input == 'exit'
#     print '> '
#     input = gets.chomp
#     case input
#     when 'builder'
#       builder
#     end
#   end
# end

def ord(i)
  ['first','second','third'][i]
end

def builder
  puts "The prototype involves exactly 3 factions."
  puts "Each faction has 3 initial wants."
  puts "Each initial want is associated with two possible reactions.\n\n"
  puts "Example: "
  puts "     The 'real estate' faction wants 'to increase sale this week'"
  puts "     The 'real estate' faction can either:                       "
  puts "          a) 'follow a lead at the hotel'                        "
  puts "          b) 'threaten its agents with a firing'                 "
  puts "          c) 'do absolutely nothing'                         \n\n"

  puts "At the end of every round, there will be a maximum of 3^3, or 27 combinations of possible responses."
  puts "Example: "
  puts "     The 'real estate' faction decided to 'follow a lead at the hotel' in order to 'increase sales this week'"






  3.times do |i|
    print "Who's the #{ord(i)} one? "
    Faction.create(name: gets.chomp)
  end
  puts "Great. Each faction wants three things starting out. We'll cycle through them now."
  Faction.all.each_with_index do |faction, i|
    print "What's the #{ord(i)} thing the '#{faction.name}' faction wants? "
  end

  puts "What happens for a Yay vote?"
  puts "What happens for a Nay vote?"
  puts "What happens for no vote?"

end

builder

#cli