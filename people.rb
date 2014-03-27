class Person
  attr_accessor :name
  def greeting
    puts "Hi, my name is #{@name}"
  end
end

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object."
  end
end

instructor1 = Instructor.new()
instructor1.name = "Chris"
instructor1.greeting

student1 = Student.new
student1.name = "Christina"
student1.greeting

# The code below won't work because there is no teach method in Person parent class
# student1.teach