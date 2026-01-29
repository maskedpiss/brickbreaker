local GameOver = {}

local retryButton = nil

function GameOver.onEnter()
  GameOver.Message = {
      font = love.graphics.newFont(128),
      text = "Game Over!",
      x = Globals.Screen.x,
      y = 50
  }
  
  GameOver.Score = {
      font = love.graphics.newFont(64),
      text = "Score: ",
      x = Globals.Screen.x,
      y = 200
  }
  
  Globals.Button = require("src/objs/button")
  retryButton = Globals.Button.new("Retry", Globals.Screen.width / 2, Globals.Screen.height / 2, function()
      GameState:changeState("play")
    end)
end


function GameOver.update(dt)
  
end


function GameOver.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(GameOver.Message.font)
  love.graphics.printf(GameOver.Message.text, GameOver.Message.x, GameOver.Message.y, Globals.Screen.width, "center")
  
  love.graphics.setFont(GameOver.Score.font)
  love.graphics.printf(GameOver.Score.text..tostring(Globals.playerScore), GameOver.Score.x, GameOver.Score.y, Globals.Screen.width, "center")
  
  retryButton:draw()
end


function GameOver.onExit()
  
end

return GameOver
