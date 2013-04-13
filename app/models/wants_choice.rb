class WantsChoice < ActiveRecord::Base
  belongs_to :want 
  belongs_to :choice

end