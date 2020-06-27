class Post < ApplicationRecord

  # has_many :comments
  validates :title, :content, presence: true
  belongs_to :user
end
