#Clase que me crea la coneccion con psqls
require 'pg'
module ActiveRecord
    class Client
        #Metodo que define la propia conexion con la bd con usuarios contraseña, y nombre de la Db
        def connection
            @connection ||=PG.connect(
                dbname: 'web_app',
                user: 'mateo',
                password: 'Colombia2019')
        end
        
        #Metodo que ejecuta un query de sql con postgres sea un update,insert, select
        def execute_query(query)
            connection.exec(query)
        end
        
    end
end