class Cell
    def initialize 
      @alive=false
    end

    def alive!
      @alive = true
    end

    def alive?
      @alive
    end

    def kill!
      @alive = false
    end

    def stay_alive?(neighbors)
      alive_neighbors = neighbors.filter(&:alive?).count 
      return true if alive? && alive_neighbors >= 2 || alive_neighbors <= 3
      return false if alive? && alive_neighbors <= 1 || alive_neighbors >= 4
      return true if !alive? && alive_neighbors == 3
      return false if !alive? && alive_neighbors != 3
    end
end