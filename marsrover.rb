# class Position
#   attr_accessor :x, :y, :d
#   def display_coordinates
#     puts "#{x}, #{y}, #{d}"
#   end
# end

class Rover
  # creates array of strings
  DIRECTIONS = %w(N E S W)

  # indices of array
  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 3

  def initialize(x,y,direction)
    @x = x
    @y = y
    @direction = direction
  end

  def move
    if @direction == "N"
      @y += 1
    elsif @direction == "E"
      @x += 1
    elsif @direction == "S"
      @y -= 1
    elsif @direction == "W"
      @y -= 1
    else
      puts "You F*D up!"
    end
  end

  def turn_right
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) + 1) % 4]
  end

  def turn_left
    puts "XXXXXXX #{@direction}"
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) - 1) % 4]
puts "yyyyyyYYY #{@direction}"
  end

  def to_s
    return "#{@x}, #{@y}, #{@direction}"
  end
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
# rover_instance = Rover.new

rover_instance = Rover.new(0,0,"N")

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
    # rover_position = Position.new
    # rover_position.x = y[0].to_i
    # rover_position.y = y[1].to_i
    # rover_position.d = y[2]
    # rover_position.display_coordinates
    rover_instance = Rover.new(y[0].to_i,y[1].to_i,y[2])
    puts rover_instance
  else
    puts "Rover movement = #{y}"
    puts "start: #{rover_instance}"
    rover_movement = y[0].split("")
    puts rover_movement.inspect
    rover_movement.each do |mv|
      case mv
      when "M"
        rover_instance.move
      when "R"
        rover_instance.turn_right
      when "L"
        rover_instance.turn_left
      end
    end
    puts "final: #{rover_instance}"
  end
  counter+=1
}

puts "\nOutput:"
puts "\nExpected Output:
1 3 N
5 1 E"