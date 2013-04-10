class Choice < ActiveRecord::Base
  attr_accessible :name

  has_many :parties, :through => :permutations
  has_many :wants, :through => :permutations
  has_many :permutations

end