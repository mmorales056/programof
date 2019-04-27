module Storage
  class Base
    def self.all
      file.map { |item| new(*item)}
    end

  #metodo que devuleve el archivo en un array mediante el map  .split me separara cada item del metodo por coma , esto se carga desde el archivo txt
    def self.file
      File.open(file_path).map {|line|line.split(',')}
    end

#Metodo que devuelve la ruta de el archivo
    def self.file_path
      File.join(APP_ROOT, 'db', "#{tableName}.txt")
    end

  #Metodo para cargar  un archivo de texto
    def self.tableName
      raise("NotImplementdError")
    end
  end
end
