class TeachersControllers < ApplicationController

  Tilt.register Tilt::ERBTemplate, "html.erb"

  set :views, File.join( APP_ROOT, 'app', 'views', 'teachers')

  get  "/" do
    @teachers = Teacher.all
    erb :index
  end

  get "/new" do
    erb :new
  end


  get  "/:id" do
      id= params[:id].to_i
   @teacher = Teacher.all[id]
   erb :show
  end


#Recibe los datos del formulario
post '/' do
  teacher = Teacher.new(teacherParams)
  teacher.save#Metodo que guarda los registros
  puts params
  redirect '/teachers'
end

def teacherParams
  params[:teacher]
end

end
