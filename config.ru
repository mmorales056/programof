#Requerimos de la clase boot que contiene todas las librerias y clases necesarias
require_relative 'boot.rb'

#CUANDO LE PASAMOS ESTUDENTS COMO PARAMETRO A LA URL SE ACTIVA StudentsController
#EJM http://localhost:9292/students
map ("/students"){run StudentsController}

map ("/teachers"){run TeachersControllers}
