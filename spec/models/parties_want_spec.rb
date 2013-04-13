require 'spec_helper'

describe PartiesWant do
  it {should allow_mass_assignment_of :party_id}
  it {should allow_mass_assignment_of :want_id}
  it {should belong_to :party}
  it {should belong_to :want}
end