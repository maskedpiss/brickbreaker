local Play = {}

local paddle = nil
local player = nil
local ball = nil
local brick = nil
local scoreBoard = nil

local rows = nil
local cols = nil

local isPaused = false

function Play.onEnter()
  if Globals.level == 1 then
    Globals.playerLives = 3
    Globals.playerScore = 0
  end
  
  Globals.playerShrunk = false
  Globals.playerMissed = false
  
  Globals.mouseVisible = false
  love.mouse.setVisible(Globals.mouseVisible)
  love.mouse.setGrabbed(true)
  
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
  brick:init(Globals.level)
end


function Play.update(dt)
  if not isPaused then
    player:update(dt)
    ball:update(dt)
  
    brick:update(dt)
    scoreBoard:update(dt)
  
    if ball.y <= Globals.Screen.y then
      player:shrink()
    elseif ball.y > Globals.Screen.height then
      Globals.playerLives = Globals.playerLives - 1
      Globals.playerScore = Globals.playerScore - 50
      
      if not Globals.playerMissed then
        Globals.playerMissed = true
      end
      
      if Globals.playerLives > 0 then
        ball:reset()
      end
    end
  
    if Globals.Collisions:AABB(ball, player) then
      Globals.Sound:playSound(Globals.Sound.SFX.HitPaddle)
      
      ball.y = player.y - ball.height
      ball.yVel = -ball.yVel
      
      local middleBall = ball.x + ball.width / 2
      local middlePaddle = player.x + player.width / 2
      local collisionPosition = middleBall - middlePaddle
      
      ball.xVel = collisionPosition * 5
    end
  
    for i, brick in ipairs(Globals.Bricks) do
      if Globals.Collisions:AABB(ball, brick) then
        if math.abs(ball.y - brick.y) < 50 then
          local hitSide = Globals.Collisions:checkBrickCollision(ball, brick)
          
          if hitSide then
            if hitSide == "horizontal" then
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
          end
        end
        
        brick.health = brick.health - 1
        
        if brick.health <= 0 then
          table.remove(Globals.Bricks, i)
          Globals.playerScore = Globals.playerScore + 100
        else
          Globals.playerScore = Globals.playerScore + 10
        end
        break
      end
    end
  
    if next(Globals.Bricks) == nil then
      if Globals.level < 28 then
        Globals.level = Globals.level + 1
        
        if not Globals.playerMissed then
          Globals.playerLives = Globals.playerLives + 1
        end
        
        GameState:changeState("levelTransition")
      else
        GameState:changeState("gameOver")
      end
    end
  
    if Globals.playerLives < 1 then
      GameState:changeState("gameOver")
    end
  end
end


function Play.keypressed(key)
  if key == "escape" then
    Play.pause()
  end
end


function Play.draw()
  player:draw()
  ball:draw()
  brick:draw()
  scoreBoard:draw()
  
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Globals.Graphics.Fonts.TitleFont)
  if isPaused then
    love.graphics.printf("PAUSED", Globals.Screen.x, 50, Globals.Screen.width, "center")
  end
end


function Play.pause()
  if not isPaused then
    isPaused = true
    Globals.mouseVisible = true
    love.mouse.setVisible(Globals.mouseVisible)
    love.mouse.setGrabbed(false)
  else
    isPaused = false
    Globals.mouseVisible = false
    love.mouse.setVisible(Globals.mouseVisible)
    love.mouse.setGrabbed(true)
  end
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
