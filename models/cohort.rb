# models/cohort.rb

class Cohort < ActiveRecord::Base

  # allows .students method to be called on instance of cohort
  has_many :students # <= method call!

end