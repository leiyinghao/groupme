class Group < ActiveRecord::Base
  validates  :title,:presence  => true
  has_many :posts
  validates :title, :presence => true
end
