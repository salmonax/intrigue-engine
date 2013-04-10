#require './spec/spec_helper'
require 'pg'
require 'active_record'
require './app/models/choice'
require './app/models/party'
require './app/models/permutation'
require './app/models/want'

my_yaml = YAML::load(File.open('./config/database.yml'))
yaml_development = my_yaml["development"]
ActiveRecord::Base.establish_connection(yaml_development)
DB = PG.connect(:dbname => 'intrigue_development')
DB.exec("DELETE FROM parties *;")
DB.exec("DELETE FROM wants *;")
DB.exec("DELETE FROM choices *;")
DB.exec("DELETE FROM permutations *;")


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
  puts "The prototype involves exactly 3 parties."
  puts "Each party has 3 initial wants."
  puts "Each initial want is associated with two possible reactions.\n\n"
  puts "Example: "
  puts "     The 'real estate' party wants 'to increase sale this week'"
  puts "     The 'real estate' party can :                         \n\n"
  puts "          a) 'follow a lead at the hotel'                        "
  puts "          b) 'threaten its agents with a firing'                 "
  puts "          c) 'do absolutely nothing'                         \n\n"
  

  puts "At the end of every round, there will be a maximum of 3^3, or 27 possible response combinations."
  puts "Assuming this affects each of the 3 factions in a unique way, that's 81 total combinations!"
  puts "If each team gets 3 ways to respone to each of 81 unique states, that's "

  puts "But don't worry! The game will never ask you for that many before helping you to continue the story."
  puts "The building game is designed to make the story-building process fun."
  puts" It's trimming down the possibilities in the background!\n\n"

  puts "Example: "
  puts "     The REAL ESTATE GUYS decided to FOLLOW A LEAD AT THE HOTEL in order to INCREASE SALES THIS WEEK"
  puts "     The REAL ESTATE GUYS decided to IGNORE THE HOTEL in order to DISTANCE THEMSELVES FROM THE PARTNERSHIP\n\n"

  3.times do |i|
    print "Who's the #{ord(i)} one? "
    Party.create(name: gets.chomp)
  end
  puts ''
  puts "Great. Each party wants three things starting out."
  puts "We'll cycle through them now."
  puts ''
  Party.all.each do |party|
    3.times do |i|
      print "What's the #{ord(i)} thing the #{party.name.upcase} want? (EXAMPLE: 'to jump in the pool') "
      party.wants << Want.create(name: gets.chomp)
    end
     puts ''
  end
  Party.all.each do |party|
    3.times do |i|
      print "What will the #{party.name.upcase} do in order #{party.wants[i].name.upcase}? "
      party.choices << Choice.create(name: gets.chomp )
    end
    puts ''
  end
  p Permutation.all
  puts "Fantastic! Now we'll cycle through the wants again. You can write an action to do for each. (EXAMPLE: 'put on a pair of swim trunks"


  puts "Awesome. Each 'CHOICE in order to PURPOSE' phrase is actually an EVENT." 


end

builder

#cli