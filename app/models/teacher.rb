class Teacher < Storage::Base
  attr_accessor :nombre, :email, :materia

  def initialize(nombre,email,materia)
    self.nombre= nombre
    self.email= email
    self.materia= materia
  end

  def self.tableName
    'teachers'
  end
end
