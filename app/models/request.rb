class Request < ApplicationRecord
  STATUS = ['accepted', 'rejected', 'pending']
  validates :content, presence: true
  validates :status, inclusion: { in: STATUS }

end
