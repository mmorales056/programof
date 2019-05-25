#este archivo se crea para  separar los require de el archivo en el console
APP_ROOT = File.dirname(__FILE__)
require "sinatra"
#toma todos los archivos que esten en config/initialize y les hace require
Dir[File.join(APP_ROOT, 'config','initializers','*rb')].each {|file| require file}

#toma todos los archivos que esten en app/controllers y les hace require
#require_relative "app/controllers/application_controller"
Dir[File.join(APP_ROOT, 'app','controllers','*rb')].each {|file| require file}


#toma todos los archivos que esten en modeles y les hace require
Dir[File.join(APP_ROOT, 'app', 'models','*rb')].each {|file| require file}

