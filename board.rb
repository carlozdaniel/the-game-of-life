# good
# Description/Explanation of Person class
class Board
  attr_reader :panel, :size
  def initialize(size)
    @size = size
    @panel = Array.new(size) { Array.new(size) { Cell.new } }
  end

  def print_panel
    puts `clear`
    @panel.each do |row|
      row.each { |cell| print cell.item }
      print "\n"
    end
    sleep 1
  end

  def random_fill
    @panel.each do |row|
      row.each { |cell| cell.alive! if rand(10) == 1 }
    end
  end

  def capture_neighbors(main_x, main_y)
    neighbors = []
    3.times do |row|
      neighbor_x = row - 1 + main_x
      3.times do |column|
        neighbor_y = column - 1 + main_y
        if validate_cell([main_x, main_y], [neighbor_x, neighbor_y])
          neighbors << panel[neighbor_x][neighbor_y]
        end
      end
    end
    neighbors
  end

  def validate_cell(main, index)
    if !index[0].negative? && index[0] < size && !index[1].negative? && index[1] < size && index != main
      true
    else
      false
    end
  end

  def next_iteration
    panel.each_with_index do |row, x_position|
      row.each_with_index do |cell, y_position|
        neighbors = capture_neighbors(x_position, y_position)
        cell.next_state = cell.stay_alive?(neighbors)
      end
    end
    new_state
  end

  def new_state
    panel.each do |row|
      row.each do |cell|
        cell.capture_next_state
      end
    end
  end
end
