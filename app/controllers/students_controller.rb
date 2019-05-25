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
  get '/:id/edit' do
    id = params[:id]
    @student =Student.find(id)
    erb :edit
  end

 # get /usuarios/id
  get "/:id" do
    id = params[:id]
    @student =Student.find(id)
    erb :show
  end

#Recibe los datos del formulario
  post '/' do
    #llamamos el metodo create
    student = Student.create(studentParams)
    redirect '/students'
  end

  delete '/:id' do
    Student.destroy(params[:id])
    redirect '/students'
  end

  put '/:id' do 
    Student.update(params[:id], studentEditParams)
    redirect 'students'
  end  

  def studentEditParams
    params[:studentEdit]
  end


#me devuelve los parametros que vienen desde new.html.erb
  def studentParams
    params[:student]
  end
end
