require_relative("../models/student")
require_relative("../models/house")
require('pry-byebug')

house1 = House.new({
  "name" => "Gryffindor",
  "url" => "/gryffindor.jpg"
  })
house1.save()

house2 = House.new({
  "name" => "Ravenclaw",
  "url" => "/ravenclaw.jpg"
  })
house2.save()

house3 = House.new({
  "name" => "Hufflepuff",
  "url" => "/hufflepuff.jpg"
  })
house3.save()

house4 = House.new({
  "name" => "Slytherin",
  "url" => "/slytherin.jpg"
  })
house4.save()


student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => 16
  })

student2 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house_id" => house1.id,
  "age" => 16
  })

student3 = Student.new({
  "first_name" => "Hermione",
  "last_name" => "Granger",
  "house_id" => house1.id,
  "age" => 16
  })


student1.save()
student2.save()
student3.save()

binding.pry
nil
