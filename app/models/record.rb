class Record < ApplicationRecord
  has_and_belongs_to_many :collection
  has_and_belongs_to_many :wanted_list
end
