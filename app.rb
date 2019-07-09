require_relative './setup'

## CREATE AND UPDATE

c1 = Cohort.new(name: 'Best ever for reals', start_date: 'May 27, 2019', location: 'Montréal')
c1.save # <= INSERT sql

c2 = Cohort.create(name: 'Best ever', start_date: 'June 04, 2018', location: 'Vancouver') # <= new and save together

# There's also .create! or .save! which throw errors (exceptions) when validation fails (more on this later)

c2.name = 'Best ever Cohort! (But less than the may 27th one.)'
# c2.save # <= UPDATE sql


# c2.location = 'Best ever Cohort! (But less than the may 27th one.)'
# c2.save # <= UPDATE sql


# c2.start_date = 'Best ever Cohort! (But less than the may 27th one.)'
c2.save # <= UPDATE sql

# This is BAD and non-idiomatic AR for two reasons:
# 1. You should not hard-code ids like this. Assuming the c1 cohort has an id of 1 is dangerous and could be incorrect
# 2. You can use associations (cohort's has_many association) to create the "child" record.
s1 = Student.create(first_name: 'K', last_name: 'V', cohort_id: 1) 

# Slightly better b/c it solves problem 1
Student.create(first_name: 'Kay', last_name: 'V', cohort_id: c1.id) # or can just use the instance c1 and AR will call .id for cohort_id
s2 = Student.find_by(first_name: 'Kay')
# But most idiomatic is to use the association defined in the cohort model
s3 = c1.students.create(first_name: 'K', last_name: 'V') # <= no cohort_id needed


### READ

Student.where(first_name: 'K').first  # .first is an array method that this array-like object supports. Same with .each

# Much like with knex we do have a query builder
# Can chain multiple where, order, limit, together to construct the query

Student.where(first_name: 'K').where(last_name: 'V').order(:cohort_id).all

# Again, can do this through a has_many "association"

c1.students.where(first_name: 'K').where(last_name: 'V').order(:cohort_id).all.each { |s| puts s.inspect }

# There's also .find_by, and other methods to help retrieve data in slightly different ways.

c1.students.all 
### DELETE is also supported

s2.destroy