class Want < ActiveRecord::Base
  attr_accessible :name

  has_many :parties, :through => :permutations
  has_many :choices, :through => :permutations
  has_many :permutations 
  
end