class Order < ApplicationRecord
  attr_accessor :token
  with_options presence: true do
    validates :token
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
  end
  belongs_to :resume
  belongs_to :user
  
end
