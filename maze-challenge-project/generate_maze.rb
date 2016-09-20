# Modified version of word_search logic
# It omits valid locations with a diagonal relation
def scan_valid(location, puzzle)
  valid_positions = []
  row = location[0]
  col = location[1]
  
  valid_positions << [row, col - 1]     if (col - 1) >= 0
  # valid_positions << [row - 1, col - 1] if (col - 1) >= 0 && (row - 1) >=0
  valid_positions << [row - 1, col]     if (row - 1) >= 0
  # valid_positions << [row - 1, col + 1] if (row - 1) >= 0 && (col + 1) < puzzle[0].length
  valid_positions << [row, col + 1]     if (col + 1) < puzzle[0].length
  # valid_positions << [row + 1, col + 1] if (row + 1) < puzzle.length && (col + 1) < puzzle[0].length
  valid_positions << [row + 1, col]     if (row + 1) < puzzle.length
  # valid_positions << [row + 1, col - 1] if (row + 1) < puzzle.length && (col - 1) >= 0
  
  return valid_positions
end


# Brute forces it's way to the target location. 
# There may be a case where a path may not be found
# Especially with a large differential between the maze length vs width
# Let's ignore that for now
def path_values(maze)

  start_path = [maze.length - 1, 1]
  end_path = [0, maze[0].length - 2]
  current_spot = [maze.length - 1, 1]
  indices = [start_path]
  possible = []

  while !possible.include?(end_path) do
    possible = scan_valid(current_spot, maze)
    possible.delete_if {|position| position[0] > current_spot[0]}
    possible.delete_if {|position| position[1] < current_spot[1]}
    temp = possible.sample
    if temp == end_path
      return indices
    elsif !indices.include?(temp) && maze[temp[0]][temp[1]] != "*"
      current_spot = temp
      indices << temp
    end
  end

  indices << end_path

  return indices
end


# Creates a border of asterisks at the left and right edges as we well at the top
# and bottom with the exception of the start and end locations, which are hard-coded
# to the dynamic dimension of the maze double Array
def populate_maze(maze)

  #Create borders and an initial start, end location.
  maze.each_with_index do |row, idx1|
    row.each_with_index do |cell, idx2|
      if (idx1 == 0 && idx2 != (row.length - 2)) || (idx1 == maze.length - 1 && (idx2 != 1))
        maze[idx1][idx2] = "*"
      elsif (idx2 == 0) || (idx2 == row.length - 1)
        maze[idx1][idx2] = "*"
      end
    end
  end

  # It only creats a path after borders have been made clear
  path = path_values(maze)

  maze.each_with_index do |row, idx1|
    row.each_with_index do |cell, idx2|
      if maze[idx1][idx2] != "*" && !path.include?([idx1, idx2])
        if !(idx1 == 0 || idx1 == maze.length - 1)
          maze[idx1][idx2] = ["*", nil].sample
        end
      end
    end
  end

  return maze
end


#Creates a double Array, representing a maze
def generate_maze(length, width)

  if length < 5 || width < 5
    raise "Invalid dimensions. Please try again."
  end

  maze = Array.new(length)
  length.times do |i|
    maze[i] = Array.new(width)
  end

  maze = populate_maze(maze)

  return maze
end

# Based on the maze dimensions, iterate a given number of times
# and collect valid collection of indices. 
# Mathematically speaking, shortest path, if not blocked,
# should be length + width - 3
def shortest_path(maze)
  start_path = [maze.length - 1, 1]
  end_path = [0, maze[0].length - 2]
  current_spot = [maze.length - 1, 1]
  indices = [start_path]
  collection_indices = []
  possible = []
  temp = []
  iter_count = maze.length * maze[0].length
  
  iter_count.times do 
    while !possible.include?(end_path) do
      possible = scan_valid(current_spot, maze)
      possible.delete_if {|position| position[0] > current_spot[0]}
      possible.delete_if {|position| position[1] < current_spot[1]}
      possible.delete_if {|position| maze[position[0]][position[1]] == "*"}
      temp = possible.sample
      if !temp
        break
      elsif temp == end_path
        return indices << end_path
      elsif !indices.include?(temp) && maze[temp[0]][temp[1]] != "*"
        current_spot = temp
        indices << temp
      end
    end
    indices << end_path
    collection_indices << indices
    current_spot = [maze.length - 1, 1]
    indices = [start_path]
  end

  return collection_indices[0]

end

test = generate_maze(13, 13)
test.length.times do |row|
  p test[row]
end

short_path = shortest_path(test)
p "The shortest path is #{short_path.length}"
p "The specific path is: "
p "#{short_path}"