class Restaurant
  include Databaseable::InstanceMethods
  extend Databaseable::ClassMethods
  
  ATTRIBUTES = {
    id: "INTEGER PRIMARY KEY",
    name: "TEXT",
    location: "TEXT",
    owner_id: "INTEGER"
  }

  attr_accessor(*self.public_attributes)  
  attr_reader :id

  def owner
    sql = <<-SQL
      SELECT * FROM owners
      WHERE id = ?
    SQL

    DB[:conn].execute(sql, self.owner_id)
  end
end