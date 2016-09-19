# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
board_string = File.readlines('sudoku_puzzles.txt').first.chomp

def generate_grid(board_string)
  current_grid = Array.new(9)
  current_grid.length.times do |row|
    current_grid[row] = Array.new(9)
  end
  current_grid[3][2] = 2
  parse_char = board_string.split('')
  parse_count = 0

  for row in 0...current_grid.length
    for col in 0...current_grid[row].length
      if (parse_char[parse_count] =~ /[0-9]/)
        current_grid[row][col] = parse_char[parse_count].to_i
      end
      parse_count += 1
    end
  end

  return current_grid
end

current_grid = generate_grid(board_string)

def generate_subgrids(board)
  quadrants = Array.new(9)
  quadrants.length.times do |row|
    quadrants[row]  = Array.new(9)
  end

  lower_bound = 0
  upper_bound = 3
  row = 0

  9.times do |i|
    temp = []
    3.times do |j|
      board[row][lower_bound...upper_bound].each do |element|
        temp << element
      end
      row += 1
      row = 0 if row == 9
    end

    lower_bound +=3 if (i + 1) % 3 == 0
    upper_bound +=3 if (i + 1) % 3 == 0
    quadrants[i] = temp
    temp = []
  end

  return quadrants
end

def deep_copy(o)
  Marshal.load(Marshal.dump(o))
end

def run(current_grid)

  possible = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  
  current_grid.each_with_index do |row, idx1|
    row.each_with_index do |col, idx2|
      # possible_row = check_row(row)
      # possible_col = check_col(current_grid.transpose, idx2)
      # possible_grid = check_grid(grid)
      # if (possible_grid & possible_row & possible_col).length == 1
      #   current_grid[idx1, idx2] = (possible_grid & possible_row & possible_col)[0]
      # end


    end
  end

end

test = run(current_grid)

9.times do |j|
  p test[j]
end
p "*" * 20
9.times do |i|
  p current_grid[i]
end


def solve(board_string)



      #find empty cell
      #pass the empty cell index and the board to check_row
      #check_row(x_index, y_index, board) return row_result []
      #if result.length == 1
      #empty cell = result
      #else check_col(x_index, y_index, board) return col_result []
      #if result.length == 1
      empty cell = col_result
      #else check_grid.......return grid_result
      # if grid_result.length == 1
      # empty cell = grid result
      #esle
      #compare results and return match []
      # if match == 1



      ## then check_col
      ## then check_grid
      ## then complex_check

end



# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
  if
    board.each do |row|
    end
    else
    false
  end

end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
end


