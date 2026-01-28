local Play = {}

local paddle = nil
local ball = nil
local scoreBoard = nil

function Play.onEnter()
  Globals.mouseVisible = false
  love.mouse.setVisible(Globals.mouseVisible)
  
  Globals.Paddle = require("src/objs/paddle")
  paddle = Globals.Paddle.new()
  
  Globals.Ball = require("src/objs/ball")
  ball = Globals.Ball.new()
  
  Globals.ScoreBoard = require("src/objs/scoreboard")
  scoreBoard = Globals.ScoreBoard.new()
end


function Play.update(dt)
  paddle:update(dt)
  ball:update(dt)
  scoreBoard:update(dt)
  
  if Globals.Collisions:AABB(ball, paddle) then
    ball.yVel = -ball.yVel
    
    local middleBall = ball.x + ball.width / 2
    local middlePaddle = paddle.x + paddle.width / 2
    local collisionPosition = middleBall - middlePaddle
    
    ball.xVel = collisionPosition * 5
  end
end


function Play.draw()
  paddle:draw()
  ball:draw()
  scoreBoard:draw()
end


function Play.onExit()
  
end

return Play
