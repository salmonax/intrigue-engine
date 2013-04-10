require 'spec_helper'

describe Party do
  it {should allow_mass_assignment_of :name}
  it {should have_many(:permutations)}
  it {should have_many(:choices).through(:permutations)}
  it {should have_many(:wants).through(:permutations)} 
end