class Player
  attr_reader :image, :x, :y
  def initialize(window)
    @image = Gosu::Image.new(window, "images/platform.png", false)
    @x = (window.width - @image.width)/2
    @y = window.height - @image.height*2
    @velocity = 3
  end
  
  def move_right
    if @x <= 578 then @x += 1 * @velocity end
  end
  
  def move_left
    if @x >= 1 then @x -= 1 * @velocity end
  end
  
  def draw
    @image.draw(@x, @y, 1)
  end
end