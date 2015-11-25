class Game

  def initialize(win_checker)
    @board = [ [nil, nil, nil], 
               [nil, nil, nil], 
               [nil, nil, nil] ]
    @pieces = [:o, :x]
    @turn = 0
    @win_checker = win_checker
    @noughts_win_count = 0
    @crosses_win_count = 0
    display_board()
    display_turn()
  end

  ################ INTERACTIVE ################

  def turn(row, column)
    if place_piece(row, column)
      display_board()
      check_for_win()
    end
  end

  ################ METHODS ################

  def place_piece(row, column)
    if out_of_range?(row, column)
      puts "Space not valid."
      replay_turn()
      return false
    end
    if space_filled?(row, column)
      puts "Space already filled."
      replay_turn()
      return false
    end
    @board[row][column] = current_piece()
  end

  def display_board
    row_strings = @board.map do |row|
      row_to_string(row)
    end
    puts row_strings.join("\n_ _ _\n")
  end

  def check_for_win
    if @win_checker.has_won?(current_piece(), @board) 
      puts "Winner is #{current_piece()}"
      increment_win_count(current_piece())
      display_score()
      reset()
    elsif board_full?
      puts "Draw"
      reset()
    else
      increment_turn()
      display_turn()
    end
  end

  def reset
    @board = [ [nil, nil, nil], [nil, nil, nil], [nil, nil, nil] ]
    @turn = 0
    @pieces.rotate!
    display_board()
  end

  def current_piece
    @pieces[@turn % 2]
  end

  ################ PRIVATE METHODS ################

  private

    def out_of_range?(row, column)
      row > 2 || column > 2
    end

    def space_filled?(row, column)
      @board[row][column]
    end

    def board_full?
      @board.flatten.all?
    end

    def row_to_string(row)
      row_symbols = row.map do |piece|
        piece || " "
      end
      row_symbols.join("|")
    end

    def increment_turn
      @turn += 1
    end

    def increment_win_count(symbol)
      case symbol
      when :o
        @noughts_win_count += 1
      when :x
        @crosses_win_count += 1
      end
    end

    def display_score
      puts "Noughts: #{@noughts_win_count} Crosses: #{@crosses_win_count}"
    end

    def display_turn
      case current_piece()
      when :o
        puts "Nought's turn:"
      when :x
        puts "Cross's turn:"
      end
    end

    def replay_turn
      display_board()
      display_turn()
    end

  ################ REDUNDANT ################

    # def turn(row, column)
    #   place_piece(row, column)
    #   display_board()
    #   check_for_win()
    # end

    # def check_for_win
    #   if  # Rows
    #       ( @board[0][0] != nil && ( @board[0][0] == @board[0][1] && @board[0][1] == @board[0][2] )) ||
    #       ( @board[1][0] != nil && ( @board[1][0] == @board[1][1] && @board[1][1] == @board[1][2] )) ||
    #       ( @board[2][0] != nil && ( @board[2][0] == @board[2][1] && @board[2][1] == @board[2][2] )) ||
    #       # Columns
    #       ( @board[0][0] != nil && ( @board[0][0] == @board[1][0] && @board[1][0] == @board[2][0] )) ||
    #       ( @board[0][1] != nil && ( @board[0][1] == @board[1][1] && @board[1][1] == @board[2][1] )) ||
    #       ( @board[0][2] != nil && ( @board[0][2] == @board[1][2] && @board[1][2] == @board[2][2] )) ||
    #       # Diagonals
    #       ( @board[0][0] != nil && ( @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] )) ||
    #       ( @board[0][2] != nil && ( @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0] ))
    #     winner = check_winner()
    #     puts "Winner is #{winner}"
    #     reset()
    #   else
    #     check_board_full()
    #   end
    # end

    # def check_winner
    #   @pieces[(@turn - 1) % 2]
    # end

    # def check_board_full
    #   if board_full?
    #     puts "Draw"
    #     reset()
    #   end
    # end


end