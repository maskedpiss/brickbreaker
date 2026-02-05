local Graphics = {}


function Graphics:loadColors()
  self.Colors = {
      black = {0, 0, 0},
      gray = {0.5, 0.5, 0.5},
      white = {1, 1, 1}
  }
end


function Graphics:loadFonts()
  self.Fonts = {
      TitleFont = love.graphics.newFont(128),
      ScoreFont = love.graphics.newFont(64),
      ButtonFont = love.graphics.newFont(32)
  }
end

return Graphics
