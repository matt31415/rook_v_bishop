# NOTE: In rails, all this validation would come for free, but
# I'm playing with straight Ruby here as an experiment
class Piece
  attr_reader :position

  def initialize(pos)
    self.position = pos
  end

  def position=(pos)
    pos.downcase!
    validate_position(pos)
    @position = pos
  end

  def row
    @position[1]
  end

  def col
    @position[0]
  end

  private

  def validate_position(pos)
    raise 'Invalid position' unless pos =~ /^[a-f][1-8]$/
  end
end
