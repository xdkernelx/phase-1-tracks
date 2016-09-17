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
        current_grid[row][col] = parse_char[parse_count]
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

def run(current_grid)
 rotated_grid = current_grid.transpose
 grid_grid = generate_subgrids(current_grid)




possible = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]


current_grid.each do |row|
  row.each_with_index do |cell, index|
    if row[index] == nil
      row_num = current_grid.index(row)
      col_num = index
      #check_row
      row_result = possible - current_grid[row_num]
      if row_result.length == 1
        current_grid[row_num][col_num] = row_result.join
      else
        col_result = row_result - rotated_grid[col_num]
        if col_result.length == 1
          current_grid[row_num][col_num] = col_result.join
        else
          if row_num <= 2
            if col_num <= 2
              grid_num = 0
            elsif col_num <=5
              grid_num = 3
            else
              grid_num = 6
            end
          elsif row_num <= 5
            if col_num <= 2
              grid_num = 1
            elsif col_num <=5
              grid_num = 4
            else
              grid_num = 7
            end
          else
            if col_num <= 2
              grid_num = 2
            elsif col_num <=5
              grid_num = 5
            else
              grid_num = 8
            end

          end
          grid_result = col_result - grid_grid[grid_num]
          if grid_result.length == 1
            current_grid[row_num][col_num] = grid_result.join
          end
        end

      end

      end
    end
  end


current_grid
end

run(current_grid)
p current_grid
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)
run(current_grid)




p current_grid


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


