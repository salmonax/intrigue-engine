require 'spec_helper'

describe Party do
  it {should allow_mass_assignment_of :name}
end