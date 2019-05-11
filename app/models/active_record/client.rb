#Clase que me crea la coneccion con psqls
require 'pg'
module ActiveRecord
    class Client
        def connection
            @connection ||=PG.connect(
                dbname: 'web_app',
                user: 'mateo',
                password: 'Colombia2019')
        end
        
        def execute_query(query)
            connection.exec(query).values
        end
        
    end
end