class Board
  attr_reader :panel
  def initialize(size)
    @size = size
    @panel = Array.new(size{Array.new(size{ Cell.new }) })
  end

  def print_board #print 
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

  def print_space_in_terminal
    puts "\n"
 end
end