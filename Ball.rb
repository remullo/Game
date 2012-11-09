class Ball
  attr_reader :x, :y , :angle, :velocity
   def initialize(window, x, y)
     @image = Gosu::Image.new(window, "images/ball.png", false)
     @x = x
     @y = y
     @velocity = 0
     @angle = Gosu::random(-60,60).to_i
   end
   
   def accelerate
     @velocity += 0.1
   end
   
   def brake
     @velocity -= 0.1
   end
   
   def move(player_x, player_y)
     platform_dist = Array.new(10) {|e| Gosu::distance(@x, @y, player_x+e*6, player_y)<=5}.include?(true)
     if(@x<=5 or @x>=637 or @y<=5 or platform_dist) then
       @angle += Gosu::random(85,95)
       @angle %= 360
     end
     @x += Gosu::offset_x(@angle, @velocity)
     @y += Gosu::offset_y(@angle, @velocity)
   end
   
   def stop
     @velocity = 0
   end
   
   def draw
     @image.draw_rot(@x, @y, 2, 0)
   end
end