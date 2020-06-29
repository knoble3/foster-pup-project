class Request < ApplicationRecord
  STATUS = ['accepted', 'rejected', 'pending']
  validates :content, presence: true
  validates :status, default: 'pending', inclusion: { in: STATUS }




end
