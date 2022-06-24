class Property < ApplicationRecord
  has_many :tours
  has_many :images
  belongs_to :user
end
