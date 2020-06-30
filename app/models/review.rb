class Review < ApplicationRecord
  belongs_to :request
  validates :content, presence: true
end
