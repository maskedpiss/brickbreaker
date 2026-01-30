local GameOver = {}

local retryButton = nil
local menuButton = nil
local exitButton = nil

function GameOver.onEnter()
  Globals.mouseVisible = true
  love.mouse.setVisible(Globals.mouseVisible)
  
  GameOver.Message = {
      font = love.graphics.newFont(128),
      text = "text",
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
  
  menuButton = Globals.Button.new("Menu", Globals.Screen.width / 2, (Globals.Screen.height / 2) + 100, function()
      GameState:changeState("menu")
    end)
  
  exitButton = Globals.Button.new("Exit", Globals.Screen.width / 2, (Globals.Screen.height / 2) + 200, function()
      love.event.quit()
    end)
end


function GameOver.update(dt)
  if Globals.playerLives > 0 then
    GameOver.Message.text = "You Win!"
  else
    GameOver.Message.text = "Game Over!"
  end
end


function GameOver.mousepressed(x, y, button)
  if retryButton:mousepressed(x, y, button) then
    return
  end
  
  if menuButton:mousepressed(x, y, button) then
    return
  end
  
  if exitButton:mousepressed(x, y, button) then
    return
  end
end


function GameOver.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(GameOver.Message.font)
  love.graphics.printf(GameOver.Message.text, GameOver.Message.x, GameOver.Message.y, Globals.Screen.width, "center")
  
  love.graphics.setFont(GameOver.Score.font)
  love.graphics.printf(GameOver.Score.text..tostring(Globals.playerScore), GameOver.Score.x, GameOver.Score.y, Globals.Screen.width, "center")
  
  retryButton:draw()
  menuButton:draw()
  exitButton:draw()
end


function GameOver.onExit()
  GameOver.Message = {}
  GameOver.Score = {}
  Globals.Button = nil
  retryButton = nil
  menuButton = nil
  exitButton = nil
end

return GameOver
