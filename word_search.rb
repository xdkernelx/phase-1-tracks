def straight_line_include?(word, puzzle)
  characters = word.split('')
end

def snaking_include?(word, puzzle)
end


# Check whether a character exists insize the puzzle grid
# 
# @param character [String] a single character, /a-zA-z/
# @param puzzle [Array] a puzzle grid, Array.new() { Array.new() }
# @param position [Array] x, y position pair, defaults to [0, 0]
# @return x, y position pair [Array] if match found, nil otherwise
def include?(character, puzzle, position = [0, 0])
  
  # Starting from the passed position pair
  #   iterate through puzzle until character is found
  #   return nil if no match found
  for row in position[0]...puzzle.length
    for col in position[1]...puzzle[0].length
      if (character == puzzle[row][col])
        return [row, col]
      end
    end
  end
  
  return nil
end

# Based on the given puzzle grid, determine next possible position
# 
# @param puzzle [Array] a puzzle grid, Array.new() { Array.new() }
# @param current_position [Array] x, y position pair
# @return x,y position pair [Array] if advancement is possible, nil otherwise
def next_position(puzzle, current_position)
  row = current_position[0]
  col = current_position[1]
  if (col + 1) < puzzle[0].length
    return [row, col + 1]
  elsif ( (col + 1) >= puzzle[0].length) && ( (row + 1) < puzzle.length)
    return [row + 1, 0]
  end
  
  return  nil
end

# Based on the given location in the given puzzle, determine
# which surrounding areas are eligible to scan.
# 
# @param location [Array] current location in puzzle grid
# @param puzzle [Array], a puzzle grid
# @return valid_positions [Array] that is populated if conditions are met 

def scan_valid(location, puzzle)
  valid_positions = []
  row = location[0]
  col = location[1]
  
  valid_positions << [row, col - 1]     if (col - 1) >= 0
  valid_positions << [row - 1, col - 1] if (col - 1) >= 0 && (row - 1) >=0
  valid_positions << [row - 1, col]     if (row - 1) >= 0
  valid_positions << [row - 1, col + 1] if (row - 1) >= 0 && (col + 1) < puzzle[0].length
  valid_positions << [row, col + 1]     if (col + 1) < puzzle[0].length
  valid_positions << [row + 1, col + 1] if (row + 1) < puzzle.length && (col + 1) < puzzle[0].length
  valid_positions << [row + 1, col]     if (row + 1) < puzzle.length
  valid_positions << [row + 1, col - 1] if (row + 1) < puzzle.length && (col - 1) >= 0
  
  return valid_positions
end

def find_next(str_arr, puzzle, valid_positions, idx = 1)
  
  path = []

  valid_positions.length.times do |i|
    location = valid_positions[i]
    if !include?(str_arr[idx], puzzle, location).nil?
      location = include?(str_arr[idx], puzzle, location)
      return location if  idx == (str_arr.length - 1)
      path << location
      p temp = find_next(str_arr, puzzle, scan_valid(location, puzzle), idx + 1)
      path << temp if !temp.nil?
      return path
    end
  end
  
  return nil
end

until location.nil? do
  # Until there are no more positions to check for the initial letter
  # Keep updating location
  # Then we want to scan the available positions for the next letter
  # We should then check for the next letter
  # We should exhaust all valid_positions only
  # If a match is found, we should find the next one
  if !include?(str[0], puzzle, location).nil?
    location = include?(str[0], puzzle, location)
    matches_collection = find_next(str, puzzle, scan_valid(location, puzzle))
  end
  
  location = next_position(puzzle, location)
end