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
    p temp
    lower_bound +=3 if (i + 1) % 3 == 0
    upper_bound +=3 if (i + 1) % 3 == 0
    quadrants[i] = temp
    temp = []
  end

  return quadrants
end