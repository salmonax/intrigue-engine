class Party < ActiveRecord::Base
  attr_accessible :name

  has_many :wants, :through => :parties_wants
  has_many :parties_wants
  
  #has_many :choices, :through => :permutations
  #has_many :permutations

end