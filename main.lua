Globals = {}
Globals.Paddle = nil

local paddle = nil

function love.load()
  Globals.Screen = {
      x = 0,
      y = 0,
      width = love.graphics.getWidth(),
      height = love.graphics.getHeight()
  }
  
  Globals.Paddle = require("src/objs/paddle")
  paddle = Globals.Paddle.new()
end


function love.update(dt)
  paddle:update(dt)
end


function love.draw()
  paddle:draw()
end
