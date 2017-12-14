require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("models/student")


get("/students") do
  @students = Student.all()
  erb(:index)
end

get("/students/new") do
  erb(:new)
end

post("/students") do
  @new_student = Student.new(params)
  @new_student.save
  erb(:create)
end








get("/students/:id") do
  @student = Student.find(params[:id])
  erb(:show)
end
