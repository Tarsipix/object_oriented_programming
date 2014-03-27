class Position
  attr_accessor :x, :y, :d
  def display_coordinates
    puts "#{x}, #{y}, #{d}"
  end
end

class Rover
  attr_accessor :p1, :input

end

class Plateau
  attr_accessor :x1, :y1, :x2, :y2
  def display_coordinates
    puts "(#{x1}, #{y1}),(#{x2}, #{y2})"
  end
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
plateau_instance = Plateau.new
plateau_instance.x1 = 0
plateau_instance.y1 = 0
rover_instance = Rover.new

input_array.each { 
  |row| 
  y = row.split(" ")
  if counter == 0
    puts "Plateau x2 y2 = #{y}"
    plateau_instance.x2 = y[0]
    plateau_instance.y2 = y[1]
    plateau_instance.display_coordinates
  elsif counter % 2 == 1
    puts "Rover coordinates = #{y}"
    rover_position = Position.new
    rover_position.x = y[0].to_i
    rover_position.y = y[1].to_i
    rover_position.d = y[2]
    rover_position.display_coordinates
  else
    puts "Rover movement = #{y}"
    

  end
  counter+=1
}

puts "\nOutput:"
puts "\nExpected Output:
1 3 N
5 1 E"