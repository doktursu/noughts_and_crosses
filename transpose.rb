require "pry-byebug"

def my_transpose(board)
  # binding.pry;''
  result = []
  board.each_index do |i|
    result[i] = []
    board.each do |row|
      result[i] << row[i]
    end
  end
  result
end


board = [ [1, 2, 3], 
          [4, 5, 6], 
          [7, 8, 9] ]

print my_transpose(board)