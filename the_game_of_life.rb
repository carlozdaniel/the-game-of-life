class The_game_of_life
  #life = ▇
  #death = ▢
 
  board_size = gets.chomp.to_i
  Row = board_size
  Column = board_size
  @VIDA = " ▇"
  @MUERTA = " ▢"

  def print_board() #print 
    
    @board = empty_board
    @board.each do |fila|
      fila.each do |celula|
        if rand(10) == 1
          @VIDA 
        else
          @MUERTA 
        end
      end
    end
  end

  def empty_board
    Array.new(Row) do 
      Array.new(Column) do
      end 
    end 
  end

  def print_space_in_terminal
    puts "\n"
 end
 

end

obj = The_game_of_life.new()
obj.print_board
obj.empty_board
obj.print_space_in_terminal