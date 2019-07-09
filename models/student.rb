class Student < ActiveRecord::Base

  # For any given instance of student, allow us to call .cohort to retrieve the cohort _instance_
  belongs_to :cohort

  # A quick example of data validation. More on this in the breakout later!
  validates :first_name, presence: true

end