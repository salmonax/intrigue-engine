class Choice < ActiveRecord::Base
  attr_accessible :name

  has_many :wants, :through => :wants_choices
  has_many :wants_choices

  #has_many :parties, :through => :permutations
  #has_many :permutations

end