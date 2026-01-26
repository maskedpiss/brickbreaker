local Ball = {}

function Ball.new()
  local instance = {}
  setmetatable(instance, { __index = Ball })
  
  instance.x = Globals.Screen.width / 2
  instance.y = Globals.Screen.height / 2
  instance.width = 20
  instance.height = instance.width
  instance.speed = 200
  instance.xVel = 0
  instance.yVel = instance.speed
  
  return instance
end


function Ball:update(dt)
  self.y = self.y + self.yVel * dt
end


function Ball:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Ball
