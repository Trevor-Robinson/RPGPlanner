class Job < ApplicationRecord
  belongs_to :campaign
  has_many :job_factions
end
