class Distribution < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :email, presence: true
  validates :body, presence: true
  validates :title, presence: true

  has_paper_trail
end
