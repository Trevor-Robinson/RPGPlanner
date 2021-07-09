class Campaign < ApplicationRecord
  belongs_to :user
  has_many :npcs
  has_many :pcs
end
