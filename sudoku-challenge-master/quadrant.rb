def quadrant?(row, col)
  if row > 6 && col > 6
    return 8
  elsif row > 3 && col > 6
    return 7
  elsif row > 0 && col > 6
    return 6
  elsif row > 6 && col > 3
    return 5
  elsif row > 3 && col > 3
    return 4
  elsif row > 0 && col > 3
    return 3
  elsif row > 6 && col > 0
    return 2
  elsif row > 3 && col > 0
    return 1
  elsif row > 0 && col > 0
    return 0
  end

  
  return nil
end