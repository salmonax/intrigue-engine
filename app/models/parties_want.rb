class PartiesWant < ActiveRecord::Base
  belongs_to :want
  belongs_to :party
end