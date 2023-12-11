class FaqItem < ApplicationRecord
  validates :question, :answer, presence: true
  validates :question, uniqueness: true
  validates :question, length: { maximum: 255 }
  validates :answer, length: { maximum: 1000 }
end
