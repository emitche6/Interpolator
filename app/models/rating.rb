class Rating < ActiveRecord::Base
  attr_accessible :interpolation_id, :stars, :user_id
  belongs_to :user
  belongs_to :interpolation, :counter_cache => true 
  validates_numericality_of :rating
end
