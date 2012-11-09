require 'gosu'
require 'Player'
require 'Ball'
require 'Brick'
require 'Constants'

class GameWindow < Gosu::Window
  def initialize
    super Constants::WINDOW_W, Constants::WINDOW_H, false
    self.caption = "Another Brick on the Wall - The Game!"
    @background = Gosu::Image.new(self, "images/bg.jpg", true)
    @bricks = Array.new(20){|i| Array.new(4){|j| Brick.new(self, 20+i*30, 15*(j+1), i%4)}}.flatten!
    @player = Player.new(self)
    @ball = Ball.new(self, @player.x()+@player.image.width/2, @player.y()-100)
  end
  
  
  def update
    if button_down? Gosu::KbLeft then @player.move_left end
    if button_down? Gosu::KbRight then @player.move_right end
    if button_down? Gosu::KbA then @ball.accelerate end
    if button_down? Gosu::KbZ then @ball.brake end
    if button_down? Gosu::KbS then @ball.stop end
    @ball.move(@player.x,@player.y)
    if(@ball.y > 485) then @ball.stop end
  end
  
  def draw
    self.caption = "x = #{"%.2f" % @ball.x}, y = #{"%.2f" % @ball.y} @ #{"%.2f" % @ball.angle} / vel = #{@ball.velocity}"
    @background.draw(0, 0, 0)
    @bricks.each {|brick| brick.draw}
    @ball.draw()
    @player.draw()
  end
end