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

  p path = path_values(maze)

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

sample = [["*", "*", "*", nil, "*"],
          ["*", nil, nil, nil, "*"],
          ["*", nil, nil, nil, "*"],
          ["*", nil, nil, nil, "*"],
          ["*", nil, "*", "*", "*"]]

test = generate_maze(5, 5)
test.length.times do |row|
  p test[row]
end