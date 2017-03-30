class Tile
  attr_reader :flagged, :revealed

  def initialize(revealed = false, bombed = false, flagged = false)
    @revealed = revealed
    @bombed = bombed
    @flagged = flagged
  end

  def place_bomb
    @bombed = true
  end

  def reveal
    @revealed = true
  end

  def flag
    @flagged = true
  end

  def unflag
    @flagged = false
  end

  def bombed?
    @bombed
  end

end