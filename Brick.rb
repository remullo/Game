class Brick
  def initialize(window, x=0, y=0, color=rand(4))
    @image = Gosu::Image.new(window, "images/bricks/brick_#{color}.png", false)
    @x = x
    @y = y
  end
  
  def draw
    @image.draw(@x, @y, 1)
  end
end