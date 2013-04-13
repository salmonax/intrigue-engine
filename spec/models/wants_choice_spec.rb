require 'spec_helper'

describe WantsChoice do
  it {should allow_mass_assignment_of :want_id}
  it {should allow_mass_assignment_of :choice_id}
  it {should belong_to :want}
  it {should belong_to :choice}
end