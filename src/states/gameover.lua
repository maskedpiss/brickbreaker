local GameOver = {}

local Button = nil
local retryButton = nil
local menuButton = nil
local exitButton = nil

function GameOver.onEnter()
  Globals.mouseVisible = true
  love.mouse.setVisible(Globals.mouseVisible)
  love.mouse.setGrabbed(false)
  
  GameOver.Message = {
      text = "text",
      x = Globals.Screen.x,
      y = 50
  }
  
  GameOver.Score = {
      text = "Score: ",
      x = Globals.Screen.x,
      y = 200
  }
  
  Button = require("src/objs/button")
  
  if Globals.playerLives <= 0 then
    retryButton = Button.new("Retry", Globals.Screen.width / 2, Globals.Screen.height / 2, function()
        GameState:changeState("play")
      end)
  end
  
  menuButton = Button.new("Menu", Globals.Screen.width / 2, (Globals.Screen.height / 2) + 100, function()
      GameState:changeState("menu")
    end)
  
  exitButton = Button.new("Exit", Globals.Screen.width / 2, (Globals.Screen.height / 2) + 200, function()
      love.event.quit()
    end)
end


function GameOver.update(dt)
  if Globals.playerLives > 0 then
    GameOver.Message.text = "You Win!"
  else
    GameOver.Message.text = "Game Over!"
  end
  
  if retryButton then
    retryButton:update(dt)
  end
  
  menuButton:update(dt)
  exitButton:update(dt)
end


function GameOver.mousepressed(x, y, button)
  if retryButton and retryButton:mousepressed(x, y, button) then
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
  love.graphics.setColor(Globals.Graphics.Colors.white)
  love.graphics.setFont(Globals.Graphics.Fonts.TitleFont)
  love.graphics.printf(GameOver.Message.text, GameOver.Message.x, GameOver.Message.y, Globals.Screen.width, "center")
  
  love.graphics.setFont(Globals.Graphics.Fonts.ScoreFont)
  love.graphics.printf(GameOver.Score.text..tostring(Globals.playerScore), GameOver.Score.x, GameOver.Score.y, Globals.Screen.width, "center")
  
  if Globals.playerLives <= 0 then
    retryButton:draw()
  end
  
  menuButton:draw()
  exitButton:draw()
end


function GameOver.onExit()
  Globals.level = 1
  GameOver.Message = {}
  GameOver.Score = {}
  Button = nil
  retryButton = nil
  menuButton = nil
  exitButton = nil
end

return GameOver
