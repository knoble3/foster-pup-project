class Dog < ApplicationRecord
  geocoded_by :address
  validates :name, presence: true
  validates :breed, presence: true
  validates :description, presence: true
  validates :address, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :requests
  has_many_attached :photos
end
