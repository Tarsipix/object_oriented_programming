class Position
  attr_reader :x, :y, :d
end

class Rover
  attr_accessor :p1, :input

end

class Plateau
  attr_accessor :x2, :y2
  @x1 = 0
  @y1 = 0
end

# Main code
puts "Welcome to MARS ROVER!"

puts "Test Input:"

user_input = "5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM"

puts user_input

input_array = user_input.split("\n")

puts "\nINPUT broken down"
counter = 0
input_array.each { 
  |x| 
  y = x.split(" ")
  if counter == 0
    puts "Plateau x2 y2 = #{y}"
  elsif counter % 2 == 1
    puts "Rover #{counter}"
  else
    puts "Rover #{counter} movement"
  end
  counter+=1
}

puts "\nOutput:"
puts "\nExpected Output:
1 3 N
5 1 E"