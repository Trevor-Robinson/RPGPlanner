class Campaign < ApplicationRecord
  belongs_to :user
  has_many :npcs
  has_many :pcs
  has_many :jobs
end
