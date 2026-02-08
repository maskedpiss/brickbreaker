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
  self.x = self.x + (mouseX - self.x) * (20 * dt)
  
  if self.x < Globals.Screen.x then
    self.x = Globals.Screen.x
  elseif self.x + self.width > Globals.Screen.width then
    self.x = Globals.Screen.width - self.width
  end
end


function Paddle:shrink()
  if not Globals.playerShrunk then
    local oldWidth = self.width
    self.width = 50
    
    local diff = oldWidth - self.width
    self.x = self.x + (diff / 2)
    
    Globals.playerShrunk = true
    Globals.Sound:playSound(Globals.Sound.SFX.PaddleShorten)
  end
end


function Paddle:draw()
  love.graphics.setColor(Globals.Graphics.Colors.white)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Paddle
