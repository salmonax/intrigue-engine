require 'spec_helper'

describe Permutation do
  it {should allow_mass_assignment_of :party_id}
  it {should allow_mass_assignment_of :choice_id}
  it {should allow_mass_assignment_of :want_id}
  it {should allow_mass_assignment_of :permutation_id}

  it {should belong_to :party}
  it {should belong_to :choice}
  it {should belong_to :want} 
end