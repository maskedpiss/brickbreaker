Globals = {}
Globals.Paddle = nil

local setVisible = false

local paddle = nil

function love.load()
  Globals.Screen = {
      x = 0,
      y = 0,
      width = love.graphics.getWidth(),
      height = love.graphics.getHeight()
  }
  
  love.mouse.setVisible(setVisible)
  
  Globals.Paddle = require("src/objs/paddle")
  paddle = Globals.Paddle.new()
end


function love.update(dt)
  paddle:update(dt)
end


function love.draw()
  paddle:draw()
end


--temp
function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end
