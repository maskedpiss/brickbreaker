local Graphics = {}

function Graphics:loadFonts()
  self.Fonts = {
      TitleFont = love.graphics.newFont(128),
      ButtonFont = love.graphics.newFont(32)
  }
end

return Graphics
