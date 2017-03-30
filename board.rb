require_relative 'tile'
require 'byebug'

class Board

  def self.random_board(size = 8, bombs = 10)
    grid = Array.new(size) { Array.new(size) }

    Board.new(grid, bombs).populate
  end

  def initialize(grid, bombs)
    @grid = grid
    @bombs = bombs
  end

  def populate
    grid.each_with_index do |row, i|
      row.each_index do |j|
        self[[i, j]] = Tile.new
      end
    end
    place_bombs
  end

  private

  attr_reader :grid, :bombs, :bombs_left

  def place_bombs
    bombs.times do
      while true
        x = rand(0...grid.length)
        y = rand(0...grid[0].length)
        unless self[[x, y]].bombed?
          self[[x, y]].place_bomb
          break
        end
      end
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

end

a = Board.random_board
