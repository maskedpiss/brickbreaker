local Paddle = {}

function Paddle.new()
  local instance = {}
  setmetatable(instance, { __index = Paddle })
  
  instance.x = Globals.Screen.width / 2
  instance.y = Globals.Screen.height - 75
  instance.width = 100
  instance.height = 20
  
  return instance
end


function Paddle:update(dt)
  local mouseX, mouseY = love.mouse.getPosition()
  
  self.x = mouseX - (self.width / 2)
end


function Paddle:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Paddle
