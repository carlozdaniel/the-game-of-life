class Board
  attr_reader :panel
  def initialize(size)
    @size = size
    @panel = Array.new(size){Array.new(size) { Cell.new }}
  end

  def print_panel #print 
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

end