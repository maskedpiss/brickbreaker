local Play = {}

local paddle = nil
local player = nil
local ball = nil
local brick = nil
local scoreBoard = nil

local rows = nil
local cols = nil

function Play.onEnter()
  if Globals.level == 1 then
    Globals.playerLives = 3
    Globals.playerScore = 0
  end
  
  Globals.playerShrunk = false
  
  Globals.mouseVisible = false
  love.mouse.setVisible(Globals.mouseVisible)
  
  paddle = require("src/objs/paddle")
  player = paddle.new()
  
  ball = require("src/objs/ball")
  ball = ball.new()
  
  scoreBoard = require("src/objs/scoreboard")
  scoreBoard = scoreBoard.new()
  
  Play.loadLevel()
end


function Play.loadLevel()
  brick = require("src/objs/brick")
  
  Globals.Bricks = {}
  
  brick:init(Globals.level)
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
    ball.y = player.y - ball.height
    ball.yVel = -ball.yVel
    
    local middleBall = ball.x + ball.width / 2
    local middlePaddle = player.x + player.width / 2
    local collisionPosition = middleBall - middlePaddle
    
    ball.xVel = collisionPosition * 5
  end
  
  for i, brick in ipairs(Globals.Bricks) do
    if Globals.Collisions:AABB(ball, brick) then
      local overlapX, overlapY
      
      if ball.xVel > 0 then
        overlapX = (ball.x + ball.width) - brick.x
      else
        overlapX = (brick.x + brick.width) - ball.x
      end
      
      if ball.yVel > 0 then
        overlapY = (ball.y + ball.height) - brick.y
      else
        overlapY = (brick.y + brick.height) - ball.y
      end
      
      if overlapX < overlapY then
        ball.xVel = -ball.xVel
        if ball.x < brick.x then
          ball.x = brick.x - ball.width
        else
          ball.x = brick.x + brick.width
        end
      else
        ball.yVel = -ball.yVel
        if ball.y < brick.y then
          ball.y = brick.y - ball.height
        else
          ball.y = brick.y + brick.height
        end
      end
      
      table.remove(Globals.Bricks, i)
      Globals.playerScore = Globals.playerScore + 100
      break
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
  rows = nil
  cols = nil
end

return Play
