require 'pry' # in case you want to use binding.pry
require 'active_record'
require_relative 'models/cohort'
require_relative 'models/student'

# Output messages from Active Record to standard out
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Establishing connection to database ...'
ActiveRecord::Base.establish_connection( 
  adapter: 'postgresql',
  database: 'w7d2',
  username: 'lhl',
  password: 'lhl',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)
puts 'CONNECTED'

puts 'Setting up Database (recreating tables) ...'

ActiveRecord::Schema.define do
  drop_table :cohorts if ActiveRecord::Base.connection.table_exists?(:cohorts)
  drop_table :students if ActiveRecord::Base.connection.table_exists?(:students)
  create_table :cohorts do |t|
    t.column :name, :string
    t.column :start_date, :date
    t.column :location, :name
    t.timestamps null: false
  end
  create_table :students do |t|
    t.references :cohort
    t.column :first_name, :string
    t.column :last_name, :string
    t.column :email, :string
    t.timestamps null: false
  end
end

puts 'Setup DONE'