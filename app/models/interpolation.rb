class Interpolation < ActiveRecord::Base
   
  attr_accessible :name, :private, :changes_attributes, :rating_average
  scope :public, where(private: false)
  scope :private, where(private: true)
  belongs_to :user
  has_many :changes
  has_many :downloads
  has_many :comments
  has_many :ratings
  validates_associated :user
  accepts_nested_attributes_for :changes

  ajaxful_rateable :stars => 5, :allow_update => true, :dimsensions => [:awesomeness]
  letsrate_rateable

  def self.most_recent
    order("created_at desc")
  end

  def self.most_downloaded
    order("downloads_count desc")
  end

  def self.highest_rated
    order("rating_average desc")
  end

  def self.avereage_rating

  end

  def self.today
    where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def self.this_week
    where("created_at >= ?", Time.zone.now.beginning_of_week)
  end

  def self.this_month
    where("created_at >= ?", Time.zone.now.beginning_of_month)
  end

  def self.this_year
    where("created_at >= ?", Time.zone.now.beginning_of_year)
  end
end
