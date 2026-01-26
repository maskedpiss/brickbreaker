local Play = {}

local paddle = nil

function Play.onEnter()
  Globals.mouseVisible = false
  love.mouse.setVisible(Globals.mouseVisible)
  
  Globals.Paddle = require("src/objs/paddle")
  paddle = Globals.Paddle.new()
end


function Play.update(dt)
  paddle:update(dt)
end


function Play.draw()
  paddle:draw()
end


function Play.onExit()
  
end

return Play
