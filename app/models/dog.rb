class Dog < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_location_and_breed,
    against: [ :breed, :address ],
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :address
  validates :name, presence: true
  validates :breed, presence: true
  validates :description, presence: true
  validates :address, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end
