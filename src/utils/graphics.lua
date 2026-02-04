local Graphics = {}

function Graphics:loadFonts()
  self.Fonts = {
      TitleFont = love.graphics.newFont(128),
      ScoreFont = love.graphics.newFont(64),
      ButtonFont = love.graphics.newFont(32)
  }
end

return Graphics
