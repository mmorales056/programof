class Teacher < ActiveRecord::Base
  #MEtodo que da nombre al archivo
  def self.tableName
    'profesores'
  end
end
