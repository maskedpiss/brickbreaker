Globals = {}
Globals.Paddle = nil
Globals.Ball = nil

local setVisible = false

local paddle = nil
local ball = nil

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
  
  Globals.Ball = require("src/objs/ball")
  ball = Globals.Ball.new()
end


function love.update(dt)
  paddle:update(dt)
end


function love.draw()
  paddle:draw()
  ball:draw()
end


--temp
function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end
