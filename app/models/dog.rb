class Dog < ApplicationRecord
  validates :name, presence: true
  validates :breed, presence: true
  validates :description, presence: true

  belongs_to :user

  has_many :requests

  has_many_attached :photos
end
