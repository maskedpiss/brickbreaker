local Play = {}

local paddle = nil
local ball = nil

function Play.onEnter()
  Globals.mouseVisible = false
  love.mouse.setVisible(Globals.mouseVisible)
  
  Globals.Paddle = require("src/objs/paddle")
  paddle = Globals.Paddle.new()
  
  Globals.Ball = require("src/objs/ball")
  ball = Globals.Ball.new()
end


function Play.update(dt)
  paddle:update(dt)
  ball:update(dt)
end


function Play.draw()
  paddle:draw()
  ball:draw()
end


function Play.onExit()
  
end

return Play
