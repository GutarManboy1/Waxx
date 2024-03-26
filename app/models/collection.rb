class Collection < ApplicationRecord
  has_many :records
  belongs_to :user
end
