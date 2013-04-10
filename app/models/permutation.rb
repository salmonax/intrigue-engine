class Permutation < ActiveRecord::Base
  attr_accessible :party_id, :choice_id, :want_id, :permutation_id

  belongs_to :party
  belongs_to :choice
  belongs_to :want

end