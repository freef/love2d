debug = true

function love.load(arg)
  collision = function(self, obj)
   if self.x+ (self.width/2)>= obj.x and self.x-50<= obj.x+obj.height and self.y+ (self.height/2)>= obj.y and self.y-50<= obj.y+obj.height then
     self.collide= true
   else 
     self.collide = false
   end
  end

  mouseRect ={}
    mouseRect.width = 100
    mouseRect.height = 100
    mouseRect.x = 100
    mouseRect.y = 100
    mouseRect.collision = collision
  bumperRect ={}
    bumperRect.width = 50
    bumperRect.height = 50
    bumperRect.x = 400
    bumperRect.y = 400
end

function love.update(dt)
  mouseRect.x, mouseRect.y = love.mouse.getPosition( )
  mouseRect.collision(bumperRect)
end

function love.draw(dt)
  love.graphics.print("Mouse Coords: ".. mouseRect.x .. ", " ..mouseRect.y )
  love.graphics.print("Collision? ".. (mouseRect.collide and "true" or "false"), 0, 10)
  if mouseRect.collide then 
    love.graphics.setColor(255,0,0) else  love.graphics.setColor(255,255,0)
  end
  love.graphics.rectangle("fill", mouseRect.x-(mouseRect.width/2), mouseRect.y-(mouseRect.height/2), 100,100)
  love.graphics.rectangle("fill", bumperRect.x, bumperRect.y, bumperRect.width, bumperRect.height)
end
