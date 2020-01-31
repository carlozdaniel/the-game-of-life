class Board
  attr_reader :panel, :size
  def initialize(size)
    @size = size
    @panel = Array.new(size){Array.new(size) { Cell.new }}
  end

  def print_panel #print 
    sleep 1
    @panel.each do |row|
      row.each { |cell| print cell.item }
      print "\n" 
    end
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
        if validate_cell(neighbor_x,neighbor_y) 
          neighbors << panel[neighbor_x][neighbor_y]
        end
      end 
    end
    neighbors 
  end 


end
