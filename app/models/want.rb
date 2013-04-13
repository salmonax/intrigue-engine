class Want < ActiveRecord::Base
  attr_accessible :name

  has_many :parties, :through => :parties_wants
  has_many :parties_wants
  
  has_many :choices, :through => :wants_choices
  has_many :wants_choices
  #has_many :choices, :through => :permutations
  #has_many :permutations 
  
end