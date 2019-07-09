# An example of how we would try and implement a simple ORM-like mapping using pseudo-ruby code
# Assumes a pg gem is available and the table is already created separarely.
# Goal: Have a class that represents our table and instances of that class represent rows/records.

class User

  attr_accessor :email, 
                :name
  attr_reader   :id

  def initialize(name, email)
    _super_name = "Super #{name}"
    @name = _super_name
    @email = email
  end

  def save
    if new_record? # doesn't have an @id
      insert
    else
      update
    end
  end

  private
  
  def new_record?
    id.blank?
  end

  def insert
    # INSERT using pg. Something like ...
     id = pg.exec('INSERT INTO users (name, email) VALUES (? , ?) RETURNING id', name, email)
  end

  def update
    # UPDATE using pg. Something like ...
    pg.exec('UPDATE users SET email=?, name=? WHERE id = ?', @id)
  end

end

# DRIVER CODE below, again, for illustration

user = User.new('KV', 'kvirani@lighthouselabs.ca')
user.save

# update
user.name = 'Khurram Virani'
user.save

