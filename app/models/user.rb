class User < ApplicationRecord
  has_one :profile
  has_many :records, through: :collection
  has_many :records, through: :wanted_list
end
