class Cell
  ITEMS = { alive: " ▇", dead: " ▢"}

  attr_reader :item

  def initialize 
    @alive = false
    @item = ITEMS[:dead]
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
    alive_neighbors = neighbors.filter(&:alive?).count 
    return true if alive? && alive_neighbors >= 2 || alive_neighbors <= 3
    return false if alive? && alive_neighbors <= 1 || alive_neighbors >= 4
    return true if !alive? && alive_neighbors == 3
    return false if !alive? && alive_neighbors != 3
  end
end