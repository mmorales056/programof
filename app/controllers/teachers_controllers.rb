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



end
