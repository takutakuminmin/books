class Post < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション

  def self.search(search)
    if search
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
