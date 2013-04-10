require 'spec_helper'

describe Choice do
  it {should allow_mass_assignment_of :name}
  it {should have_many(:permutations)}
  it {should have_many(:parties).through(:permutations)}
  it {should have_many(:wants).through(:permutations)} 

end