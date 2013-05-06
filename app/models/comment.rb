class Comment < ActiveRecord::Base
  attr_accessible :content, :interpolation_id, :user_id
  belongs_to :interpolation, :counter_cache => true
  belongs_to :user
  attr_accessible :content
  validates_presence_of :content
  validates_associated :interpolation, :user
end
