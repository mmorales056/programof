class Student < Storage::Base
  attr_accessor :nombre, :correo, :fecha, :programa

  def initialize(nombre, correo, fecha, programa)
    self.nombre = nombre
    self.correo = correo
    self.fecha = fecha
    self.programa = programa
  end

  def self.tableName
    'students'
  end


end
