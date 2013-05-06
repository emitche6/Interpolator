class Download < ActiveRecord::Base
  belongs_to :user
  belongs_to :interpolation, :counter_cache => true
  validates_associated :user, :interpolation
end
