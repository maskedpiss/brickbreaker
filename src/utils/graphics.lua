local Graphics = {}

function Graphics:loadColors()
  self.Colors = {
      black = {0, 0, 0},
      gray = {0.5, 0.5, 0.5},
      white = {1, 1, 1}
  }
  
  self.BrickTypes = {
      {1, 1, 1}, --Type 1: white
      {1, 1, 0}, --Type 2: yellow
      {0, 1, 0}, --Type 3: green
      {1, 0.47, 0}, --Type 4: orange
      {1, 0, 0} --Type 5: red
  }
end


function Graphics:loadFonts()
  self.Fonts = {
      TitleFont = love.graphics.newFont("res/fonts/Pixelmania.ttf", 78),
      ScoreFont = love.graphics.newFont("res/fonts/PixelTwist.ttf", 64),
      ButtonFont = love.graphics.newFont("res/fonts/PixelTwist.ttf", 32)
  }
  
  for _, font in pairs(self.Fonts) do
    font:setFilter("nearest", "nearest")
  end
end

return Graphics
