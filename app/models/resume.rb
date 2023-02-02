class Resume < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :orders

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :resume_text, length: { maximum: 1000 }
  end
  validates :price, presence: true
  validates :price,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999, message: 'は0円から9,999,999円の範囲で入力してください' }
  validates :price, numericality: { only_integer: true, message: 'は半角数字で入力してください' }
end

