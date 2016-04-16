class Comment < ActiveRecord::Base
  belongs_to :post
  validates :name, length:  {maximum: 30 }
  validates :content, length: {maximum: 300 }, presence: true
end
