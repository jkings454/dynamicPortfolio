class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  def self.search(search)
   where("title LIKE ? OR content LIKE?", "%#{search}%", "%#{search}%")
  end
end
