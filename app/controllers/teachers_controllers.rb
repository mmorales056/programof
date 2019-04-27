class TeachersControllers < ApplicationController

  Tilt.register Tilt::ERBTemplate, "html.erb"

  set :views, File.join( APP_ROOT, 'app', 'views', 'teachers')

  get  "/" do
    @teachers = Teacher.all
    erb :index
  end

  get  "/:id" do
      id= params[:id].to_i
   @teacher = Teacher.all[id]
   erb :show
  end

  get  "/:id/:id2" do
      id= params[:id].to_i
      id2= params[:id2].to_i
   @teacher1 = Teacher.all[id][id2]
   #@teacher2 = Teacher.all[id2]
   erb :show2

  end


end
