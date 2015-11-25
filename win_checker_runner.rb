require_relative "win_checker"

win_checker = WinChecker.new()

empty_board = [ [nil, nil, nil], 
                [nil, nil, nil], 
                [nil, nil, nil] ]

symbol = :o

puts "check that empty board does not win: #{win_checker.has_won?(symbol, empty_board)} expect false"

horizontal_board = [ [nil, nil, nil], [:o, :o, :o], [nil, nil, nil] ]

puts "check that horizontal board wins: #{win_checker.has_won?(symbol, horizontal_board)} expect true"