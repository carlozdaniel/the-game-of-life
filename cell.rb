class Cell
  ITEMS = { alive: " ▇", dead: " ▢"}
  

  attr_reader :item
  attr_accessor :next_state

  def initialize 
    @alive = false
    @item = ITEMS[:dead]
    @next_state = false 
  
  end

  def capture_next_state
   next_state ? alive! : kill! 
  #  puts alive?
  end

  def alive!
    @alive = true
    @item = ITEMS[:alive]
  end

  def alive?
    @alive
  end

  def kill!
    @alive = false
    @item = ITEMS[:dead]
  end

  def stay_alive?(neighbors)
    alive_neighbors = neighbors.select{ |element| element.alive? }.count   #(&:alive?).count 
    return true if alive? && alive_neighbors >= 2 && alive_neighbors <= 3
    return false if alive? && alive_neighbors <= 1 && alive_neighbors >= 4
    return true if !alive? && alive_neighbors == 3
    return false if !alive? && alive_neighbors != 3
  end
end
