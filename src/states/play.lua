local Play = {}

local paddle = nil
local ball = nil
local brick = nil
local scoreBoard = nil

function Play.onEnter()
  Globals.playerLives = 3
  
  Globals.mouseVisible = false
  love.mouse.setVisible(Globals.mouseVisible)
  
  Globals.Paddle = require("src/objs/paddle")
  paddle = Globals.Paddle.new()
  
  Globals.Ball = require("src/objs/ball")
  ball = Globals.Ball.new()
  
  Globals.ScoreBoard = require("src/objs/scoreboard")
  scoreBoard = Globals.ScoreBoard.new()
  
  Globals.Brick = require("src/objs/brick")
  brick = Globals.Brick
  brick:init(1, 1)
end


function Play.update(dt)
  paddle:update(dt)
  ball:update(dt)
  
  brick:update(dt)
  scoreBoard:update(dt)
  
  if Globals.Collisions:AABB(ball, paddle) then
    ball.yVel = -ball.yVel
    
    local middleBall = ball.x + ball.width / 2
    local middlePaddle = paddle.x + paddle.width / 2
    local collisionPosition = middleBall - middlePaddle
    
    ball.xVel = collisionPosition * 5
  end
  
  for i, brick in ipairs(Globals.Bricks) do
    if Globals.Collisions:AABB(ball, brick) then
      ball.yVel = -ball.yVel
      
      local middleBall = ball.x + ball.width / 2
      local middleBrick = brick.x + brick.width / 2
      local collisionPosition = middleBall - middleBrick
      
      ball.xVel = collisionPosition * 5
      
      table.remove(Globals.Bricks, i)
      Globals.playerScore = Globals.playerScore + 100
    end
  end
  
  if next(Globals.Bricks) == nil then
    GameState:changeState("gameOver")
  end
  
  if Globals.playerLives < 1 then
    GameState:changeState("gameOver")
  end
end


function Play.draw()
  paddle:draw()
  ball:draw()
  brick:draw()
  scoreBoard:draw()
end


function Play.onExit()
  Globals.Paddle = nil
  Globals.Ball = nil
  Globals.ScoreBoard = nil
  Globals.Brick = nil
  paddle = nil
  ball = nil
  scoreBoard = nil
  brick = nil
end

return Play
