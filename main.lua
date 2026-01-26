Globals = {}
Globals.Bricks = {}
Globals.Collisions = require("src/utils/collisions")
Globals.playerScore = 0
Globals.playerLives = 3
Globals.Paddle = nil
Globals.Ball = nil
Globals.Brick = nil
Globals.ScoreBoard = nil

local setVisible = false

local paddle = nil
local ball = nil
local scoreboard = nil

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
  
  Globals.Brick = require("src/objs/brick")
  Globals.Brick:init(8, 16)
  
  Globals.ScoreBoard = require("src/objs/scoreboard")
  scoreboard = Globals.ScoreBoard.new()
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
  
  for i, brick in ipairs(Globals.Bricks) do
    if Globals.Collisions:AABB(ball, brick) then
      table.remove(Globals.Bricks, i)
      ball.yVel = -ball.yVel
      
      local middleBall = ball.x + ball.width / 2
      local middleBrick = brick.x + brick.width / 2
      local collisionPosition = middleBall - middleBrick
      
      ball.xVel = collisionPosition * 5
    end
  end
end


function love.draw()
  paddle:draw()
  ball:draw()
  Globals.Brick:draw()
  scoreboard:draw()
end


--temp
function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end
