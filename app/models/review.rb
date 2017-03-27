class Review 
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods

  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    content: "TEXT",
    customer_id: "INTEGER",
    restaurant_id: "INTEGER"
  }

  attr_accessor(*self.public_attributes)  
  attr_reader :id

  

  def customer
    sql = <<-SQL
      SELECT * FROM customers
      WHERE id = ?
    SQL

    DB[:conn].execute(sql, self.customer_id)
  end

  def restaurant
    sql = <<-SQL
      SELECT * FROM restaurants
      WHERE id = ?
    SQL

    DB[:conn].execute(sql, self.restaurant_id)
  end

end

