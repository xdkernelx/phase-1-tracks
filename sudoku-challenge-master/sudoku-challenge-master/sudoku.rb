# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
current_grid =
[["1", nil, "5", "8", "3", "2", "7", "6", "9"],
 [nil, "9", "4", nil, "7", "6", "4", nil, "5"],
 ["2", nil, "3", "4", nil, nil, "8", "1", "9"],
 [nil, "1", "9", nil, nil, "7", "3", nil, "6"],
 ["7", "6", "2", nil, "8", "3", nil, "9", nil],
 [nil, nil, nil, nil, "6", "1", nil, "5", nil],
 [nil, nil, "7", "6", nil, nil, nil, "3", nil],
 ["4", "3", "1", nil, "2", nil, "5", nil, "1"],
 ["6", nil, "6", "3", nil, "8", "9", nil, nil]]


# def create_grid_grid(current_grid)
#  grid_grid = Array.new(9,Array.new(9))
#   current_grid.each do |row|
#     row.each_with_index do |cell, index|
#       row_num = current_grid.index(row)
#       col_num = index

#       if row_num <= 2
#           if col_num <= 2
#               grid_num = 0
#           elsif col_num <=5
#               grid_num = 1
#           else
#               grid_num = 2
#           end
#       elsif row_num <= 5
#           if col_num <= 2
#               grid_num = 3
#           elsif col_num <=5
#               grid_num = 4
#           else
#               grid_num = 5
#           end
#       else
#           if col_num <= 2
#               grid_num = 6
#           elsif col_num <=5
#               grid_num = 7
#           else
#               grid_num = 8
#           end
#       end

#       grid_grid[grid_num][index] = cell
#     end

#   end
#   grid_grid
# end

p create_grid_grid(current_grid)

 # [["1",nil,"5",nil,"9","4","2",nil,"3"],
 #  ["8","3","2",nil,"7","6","4",nil,nil],
 #  ["7","6","9","4",nil,"5","8","1","8"],
 #  [nil,"1","9","7","6","2",nil,nil,nil],
 #  [nil,nil,"7",nil,"8","3",nil,"6","1"],
 #  ["3",nil,"6",nil,"9",nil,nil,"5",nil],
 #  [nil,nil,"7","4","3","1","6",nil,"6"],
 #  ["6",nil,nil,nil,"2",nil,"3",nil,"8"],
 #  [nil,"3",nil,"5",nil,"1","9",nil,nil]
 #  ]


def run(current_grid)
 rotated_grid = current_grid.transpose





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
              grid_num = 1
            else
              grid_num = 2
            end
          elsif row_num <= 5
            if col_num <= 2
              grid_num = 3
            elsif col_num <=5
              grid_num = 4
            else
              grid_num = 5
            end
          else
            if col_num <= 2
              grid_num = 6
            elsif col_num <=5
              grid_num = 7
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

# run(current_grid)
# p current_grid
# run(current_grid)
# run(current_grid)
# run(current_grid)
# run(current_grid)
# run(current_grid)
# p current_grid


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


