require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("models/student")


get("/students") do
  @students = Student.all()
  erb(:index)
end
