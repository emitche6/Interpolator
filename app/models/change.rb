class Change < ActiveRecord::Base
  attr_accessible :regex_old, :regex_new
  belongs_to :interpolation
  validates_presence_of :regex_old, :regex_new
  validates_associated :interpolation
end
