module Storage
  class Base
    def initialize(params = {})
      params.each do   |key,value|
        instance_variable_set("@#{key}",value) #Metodo que toma una variable de instacia y la crea con su valor
        self.class.send(:define_method,key) do #:define_method crea un motodo para traer los valores
          instance_variable_get("@#{key}")
        end
      end
    end


#Metodo para escribir sobre el archivo
    def save
      headers =self.class.file_headers #Capturamos los encabezados
      collection = self.class.all #Capturamos todos los re
      collection << self

        CSV.open(self.class.file_path,'w') do |csv| #Iteramos el archivo cada campo esta en el csv
          csv << headers  #adicionamos al csv el encabezado
          collection.each do |record|#iteramos todos los registros
            values = headers.map do |header|#guardamos  en values la coleecion que nos delvuelve el. map
              record.send(header)
            end
            csv << values#Adicionamos al csv los datos del value
          end
        end
    end

    def self.all
      CSV.foreach(file_path, headers: true).map { |item| new(item) }
    end

#Metodo que saca los encabezados del archivo siempre es la linea 1 del archivo
    def self.file_headers
      CSV.open(file_path, &:readline)
    end

#Metodo que devuelve la ruta de el archivo
    def self.file_path
      File.join(APP_ROOT, 'db', "#{tableName}.csv")
    end

  #Metodo para cargar  un archivo de texto
    def self.tableName
      raise("NotImplementedError")
    end
  end
end
