class User < ActiveRecord::Base
  attr_accessible :crypted_password, :email, :password_salt, :persistence_token, :username, :password, :password_confirmation
  acts_as_authentic
  has_many :downloads
  has_many :comments
  has_many :ratings
  has_many :interpolations
  validates_presence_of :username

  ajaxful_rater
  letsrate_rater

end
