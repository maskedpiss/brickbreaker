Globals = {}
Globals.Collisions = require("src/utils/collisions")
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
  ball:update(dt)
  
  if Globals.Collisions:AABB(ball, paddle) then
    ball.y = paddle.y - ball.height
    ball.yVel = -ball.yVel
    
    local middleBall = ball.x + ball.width / 2
    local middlePaddle = paddle.x + paddle.width / 2
    local collisionPosition = middleBall - middlePaddle
    
    ball.xVel = collisionPosition * 5
  end
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
