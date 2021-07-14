class Campaign < ApplicationRecord
  belongs_to :user
  has_many :npcs
  has_many :pcs
  has_many :jobs
  has_many :systems
  has_many :factions
  has_many :notable_places, through: :systems
end
