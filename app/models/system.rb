class System < ApplicationRecord
  belongs_to :campaign
  has_many :notable_places
  has_many :turves
end
