board_string = File.readlines('sudoku-challenge-master/sudoku-challenge-master/sudoku_puzzles.txt').first.chomp

def generate_subgrids(board_string)
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

p generate_grid(board_string)