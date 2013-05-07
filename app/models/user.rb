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
  
  def options
    a = Array.new
    self.downloads.each do |d|
      d.interpolation.changes.each do |c|
        b = Array.new
        b.push(c.regex_old)
        b.push(c.regex_new)
        a.push(b)
      end
    end
    return a
  end


end
