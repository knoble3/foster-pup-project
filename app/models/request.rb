class Request < ApplicationRecord
  STATUS = ['accepted', 'rejected', 'pending']
  validates :content, presence: true
  validates :status, inclusion: { in: STATUS }

  belongs_to :dog
  belongs_to :user

  has_many :reviews

end
