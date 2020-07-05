class Post < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
  def self.search(search)
    if search
      Post.where('title LIKE(?)', "%#{search}%")
      # Post.where('author LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
