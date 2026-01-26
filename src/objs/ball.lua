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
  self.x = self.x + self.xVel * dt
  self.y = self.y + self.yVel * dt
  
  if self.x < Globals.Screen.x then
    self.x = Globals.Screen.x
    self.xVel = -self.xVel
  elseif self.x + self.width > Globals.Screen.width then
    self.x = Globals.Screen.width - self.width
    self.xVel = -self.xVel
  end
  
  if self.y < Globals.Screen.y then
    self.y = Globals.Screen.y
    self.yVel = -self.yVel
  end
end


function Ball:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Ball
