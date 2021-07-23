class Faction < ApplicationRecord
  belongs_to :campaign
  has_many :turves
  has_many :job_factions
end
