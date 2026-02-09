local Paddle = {}

function Paddle.new()
  local instance = {}
  setmetatable(instance, { __index = Paddle })
  
  instance.width = 100
  instance.height = 20
  instance.x = (Globals.Screen.width / 2) - (instance.width / 2)
  instance.y = Globals.Screen.height - 75
  
  return instance
end


function Paddle:update(dt)
  local mouseX, mouseY = love.mouse.getPosition()
  local target = mouseX - (self.width / 2)
  self.x = self.x + (target - self.x) * (20 * dt)
  self.x = math.max(0, math.min(self.x, Globals.Screen.width - self.width))
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
