local Ball = {}

function Ball.new()
  local instance = {}
  setmetatable(instance, { __index = Ball })
  
  instance:reset()
  
  return instance
end


function Ball:reset()
  self.x = Globals.Screen.width / 2
  self.y = Globals.Screen.height / 2
  self.width = 20
  self.height = self.width
  self.speed = 300
  self.xVel = love.math.random(-50, 50)
  self.yVel = -self.speed
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
  love.graphics.setColor(Globals.Graphics.Colors.white)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Ball
