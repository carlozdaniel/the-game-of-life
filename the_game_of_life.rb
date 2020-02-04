require_relative 'board'
require_relative 'cell'
puts 'dame el tamaño del tablero'
new_board = Board.new(gets.chomp.to_i)
new_board.random_fill
loop do
  new_board.print_panel
  new_board.next_iteration
end