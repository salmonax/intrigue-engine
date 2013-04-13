require 'spec_helper'

describe Want do
  it {should allow_mass_assignment_of :name}

  it {should have_many(:parties).through(:parties_wants)}
  it {should have_many(:choices).through(:wants_choices)}
  
  # it {should have_many(:permutations)}
  # it {should have_many(:parties).through(:permutations)}
  # it {should have_many(:choices).through(:permutations)}
end