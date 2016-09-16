def generate_grid(board_string)   current_grid = Array.new(3, Array.new(3) {
["-", "X"].sample })

  parse_char = board_string.split('')
  parse_count = 0

  test = current_grid.length

  3.times do |row|
    3.times do |idx|
      current_grid[row][idx] = parse_char[parse_count]
      parse_count += 1
    end
  end

  return current_grid
end

p generate_grid(board_string)