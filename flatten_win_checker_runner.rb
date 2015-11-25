require_relative "flatten_win_checker"

win_checker = FlattenWinChecker.new()

hor_board = [ [nil, :x, nil], [:o, :o, :o], [:x, :x, nil] ]
ver_board = [ [:o, :x, nil], [:o, :o, :x], [:o, :x, :x] ]
diag_board = [ [nil, :x, :o], [:x, :o, :o], [:o, :x, nil] ]


# print win_checker.winning_lines
puts "hor_board check for win: expect true, output #{win_checker.has_won?(:o, hor_board)}"
puts "ver_board check for win: expect true, output #{win_checker.has_won?(:o, ver_board)}"
puts "diag_board check for win: expect true, output #{win_checker.has_won?(:o, diag_board)}"

puts "hor_board check for win: expect false, output #{win_checker.has_won?(:x, hor_board)}"
puts "ver_board check for win: expect false, output #{win_checker.has_won?(:x, ver_board)}"
puts "diag_board check for win: expect false, output #{win_checker.has_won?(:x, diag_board)}"

