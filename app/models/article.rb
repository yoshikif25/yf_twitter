class Article < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :notifications
  validates :tweet, presence: true
end
