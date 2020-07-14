class Article < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :tweet, presence: true
end
