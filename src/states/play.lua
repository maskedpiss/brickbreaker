local Play = {}

local paddle = nil
local player = nil
local ball = nil
local brick = nil
local scoreBoard = nil

function Play.onEnter()
  Globals.playerLives = 3
  Globals.playerScore = 0
  Globals.playerShrunk = false
  
  Globals.mouseVisible = false
  love.mouse.setVisible(Globals.mouseVisible)
  
  paddle = require("src/objs/paddle")
  player = paddle.new()
  
  ball = require("src/objs/ball")
  ball = ball.new()
  
  scoreBoard = require("src/objs/scoreboard")
  scoreBoard = scoreBoard.new()
  
  brick = require("src/objs/brick")
  brick:init(1, 16)
end


function Play.update(dt)
  player:update(dt)
  ball:update(dt)
  
  brick:update(dt)
  scoreBoard:update(dt)
  
  if ball.y <= Globals.Screen.y then
    player:shrink()
  end
  
  if Globals.Collisions:AABB(ball, player) then
    ball.yVel = -ball.yVel
    
    local middleBall = ball.x + ball.width / 2
    local middlePaddle = player.x + player.width / 2
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
    if Globals.level < 8 then
      Globals.level = Globals.level + 1
      GameState:changeState("levelTransition")
    else
      GameState:changeState("gameOver")
    end
  end
  
  if Globals.playerLives < 1 then
    GameState:changeState("gameOver")
  end
end


function Play.draw()
  player:draw()
  ball:draw()
  brick:draw()
  scoreBoard:draw()
end


function Play.onExit()
  paddle = nil
  player = nil
  ball = nil
  scoreBoard = nil
  brick = nil
end

return Play
