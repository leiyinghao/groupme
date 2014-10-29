class Post < ActiveRecord::Base
  belongs_to :group, :counter_cache => true
  validates :content, :presence => true

end
