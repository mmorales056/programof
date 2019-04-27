class StudentsController < ApplicationController

  # Construimos la ruta por la cual se cargaran las vistas
  Tilt.register Tilt::ERBTemplate, "html.erb"

  set :views, File.join( APP_ROOT, 'app', 'views', 'students')

  #get / usuarios
  get "/" do
    @students  = Student.all #llamamos al metodo all de la clase Student
    erb :index
  end
 # get /usuarios/id

  get "/:id" do
    id = params[:id].to_i
    @student =Student.all[id]
    erb :show
  end


end
