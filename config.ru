# este archivo Se encarga de mapear todos los modelos los controladores y las vistas del proyecto
require "sinatra"


APP_ROOT = File.dirname(__FILE__)
require_relative "app/controllers/application_controller.rb"
require_relative "app/controllers/students_controller.rb"
require_relative "app/controllers/teachers_controllers.rb"

require_relative "app/models/base.rb"
require_relative "app/models/student.rb"
require_relative "app/models/teacher.rb"


#CUANDO LE PASAMOS ESTUDENTS COMO PARAMETRO A LA URL SE ACTIVA StudentsController
#EJM http://localhost:9292/students
map ("/students"){run StudentsController}

map ("/teachers"){run TeachersControllers}
