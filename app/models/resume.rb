class Resume < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :orders
end
