class StudentsController < ApplicationController

  # Construimos la ruta por la cual se cargaran las vistas
  Tilt.register Tilt::ERBTemplate, "html.erb"

  set :views, File.join( APP_ROOT, 'app', 'views', 'students')

  #get / student
  get "/" do
    @students  = Student.all #llamamos al metodo all de la clase Student
    erb :index
  end
#get / student/new
  get '/new' do
    erb:new
  end

 # get /usuarios/id
  get "/:id" do
    id = params[:id].to_i
    @student =Student.all[id]
    erb :show
  end

#Recibe los datos del formulario
  post '/' do
    student = Student.new(studentParams)
    student.save#Metodo que guarda los registros
    puts params
    redirect '/teachers'
  end

#me devuelve los parametros que vienen desde new.html.erb
  def studentParams
    params[:student]
  end




end
