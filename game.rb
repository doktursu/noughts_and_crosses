class Game

  def initialize
    @board = [ [nil, nil, nil], 
               [nil, nil, nil], 
               [nil, nil, nil] ]
    @pieces = [:o, :x]
    @turn = 0
    display_board()
  end

  def turn(row, column)
    place_piece(row, column)
    display_board()
    check_for_win()
    increment_turn()
  end

  def current_piece
    @pieces[@turn % 2]
  end


  ############# CHECK FOR WIN #############

  def check_for_win
    if has_won?(current_piece()) 
      display_winner(current_piece())
    elsif board_full?
      puts "Draw"
      reset()
    end
  end

  def display_winner(symbol)
    puts "Winner is #{symbol}"
  end

  def has_won?(symbol)
    horizontal_line?(symbol) ||
    vertical_line?(symbol) ||
    diagonal_line?(symbol)
  end

  def horizontal_line?(symbol)
    @board.any? do |row|
      row_has_winning_line?(row, symbol)
    end
  end

  def row_has_winning_line?(row, symbol)
    row.all? do |square|
      square == symbol
    end
  end

  def vertical_line?(symbol)
    @board.transpose.any? do |row|
      row_has_winning_line?(row, symbol)
    end
  end

  def diagonal_line?(symbol)
    middle_piece = @board[1][1]
    return false if middle_piece != symbol
    top_left_and_bottom_right = @board[0][0] == symbol && @board[2][2] == symbol
    top_right_and_bottom_left = @board[0][2] == symbol && @board[2][0] == symbol
    top_left_and_bottom_right || top_right_and_bottom_left
  end


  ############################



  def place_piece(row, column)
    if out_of_range?(row, column)
      "Space not valid."
      return false
    end
    if space_filled?(row, column)
      "Space already filled."
      return false
    end
    @board[row][column] = current_piece()
  end

  def increment_turn
    @turn += 1
  end

  def display_board
    row_strings = @board.map do |row|
      row_to_string(row)
    end
    puts row_strings.join("\n_ _ _\n")
  end

  def reset
    @board = [ [nil, nil, nil], [nil, nil, nil], [nil, nil, nil] ]
    @turn = 0
    @pieces.rotate!
    display_board()
  end



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


    ############ REDUNDANT ################

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