local Button = {}

local mouseX, mouseY

function Button.new(text, x, y, callback)
  local instance = {}
  setmetatable(instance, { __index = Button })
  
  instance.color = Globals.Graphics.Colors.white
  instance.text = text
  instance.width = 150
  instance.height = 75
  instance.x = x - (instance.width / 2)
  instance.y = y - (instance.width / 2)
  instance.callback = callback or function() end
  
  return instance
end


function Button:update(dt)
  mouseX, mouseY = love.mouse.getPosition()
  if self:isHovering(mouseX, mouseY) then
    self.color = Globals.Graphics.Colors.gray
  else
    self.color = Globals.Graphics.Colors.white
  end
end


function Button:isHovering(x, y)
  return x > self.x and x < self.x + self.width and
         y > self.y and y < self.y + self.height
end


function Button:mousepressed(x, y, button)
  if self:isHovering(x, y) and button == 1 then
    self:callback()
    Globals.Sound:playSound(Globals.Sound.SFX.ButtonClick)
    return true
  end
  return false
end


function Button:draw()
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  
  love.graphics.setColor(Globals.Graphics.Colors.black)
  love.graphics.setFont(Globals.Graphics.Fonts.ButtonFont)
  
  local fontHeight = Globals.Graphics.Fonts.ButtonFont:getHeight()
  local textY = self.y + (self.height / 2) - (fontHeight / 2)
  love.graphics.printf(self.text, self.x, textY, self.width, "center")
end

return Button
