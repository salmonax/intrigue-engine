#require './spec/spec_helper'
require 'pg'
require 'active_record'
require './app/models/choice'
require './app/models/party'
require './app/models/permutation'
require './app/models/parties_want'
require './app/models/wants_choice'
require './app/models/want'
require 'pry'
require 'pry-debugger'

my_yaml = YAML::load(File.open('./config/database.yml'))
yaml_development = my_yaml["development"]
ActiveRecord::Base.establish_connection(yaml_development)
DB = PG.connect(:dbname => 'intrigue_development')
DB.exec("DELETE FROM parties *;")
DB.exec("DELETE FROM wants *;")
DB.exec("DELETE FROM choices *;")
#DB.exec("DELETE FROM permutations *;")
DB.exec("DELETE FROM parties_wants *;")
DB.exec("DELETE FROM wants_choices *;")

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
  puts "Great. Each party wants only one thing starting out."
  puts "Try to make it a simple, immediate want. You will be able to decide on 'ultimate' wants as you move through the story."
  puts ''
  Party.all.each do |party|
    1.times do |i|
      #binding.pry
      print "#{ord(i).capitalize}, the #{party.name.upcase} want to... (EXAMPLE: 'jump in the pool') "
      party.wants.create(name: gets.chomp)
    end
     puts ''
  end
  Party.all.each do |party|
    1.times do |i|
      print "In order to #{party.wants[i].name.upcase}, the #{party.name.upcase} will..."
      party.wants[i].choices.create(name: gets.chomp)
    end
    puts ''
  end

  puts "Awesome. Each ACTION and PURPOSE combination is actually a kind of EVENT."
  puts "However, if you add an alternative ACTION, this EVENT becomes a CHOICE." 
  puts "Your players will get to vote which course of action to take!"

  Party.all.each do |party|
    1.times do |i|
      print "In order to #{party.wants[i].name.upcase}, the #{party.name.upcase} could #{party.wants[i].choices.first.name.upcase}, but they might also..."
      possible_choice = gets.chomp
      party.wants[i].choices.create(name: possible_choice) if possible_choice != ''
    end
    puts ''
  end

  Party.all.each do |party|
    party.wants.all.each do |want|
      want.choices.all.each do |choice|
        puts 'The ' + party.name.upcase + ' decided to ' + choice.name.upcase + ' in order to ' + want.name.upcase 
      end
    end
  end

end

builder

#cli