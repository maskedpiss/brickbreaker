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
      text = "score: ",
      x = Globals.Screen.x,
      y = 200
  }
  
  Button = require("src/objs/button")
  retryButton = Button.new("Retry", Globals.Screen.width / 2, Globals.Screen.height / 2, function()
      GameState:changeState("play")
    end)
  
  menuButton = Button.new("Menu", Globals.Screen.width / 2, (Globals.Screen.height / 2) + 100, function()
      GameState:changeState("menu")
    end)
  
  exitButton = Button.new("Exit", Globals.Screen.width / 2, (Globals.Screen.height / 2) + 200, function()
      love.event.quit()
    end)
  
  if Globals.playerLives > 0 then
    GameOver.Message.text = "YOU WIN"
  else
    GameOver.Message.text = "GAME OVER"
  end
  
  GameOver.pickSound()
end


function GameOver.pickSound()
  if Globals.playerLives > 0 then
    Globals.Sound:playSong(Globals.Sound.Song.Win)
  else
    Globals.Sound:playSong(Globals.Sound.Song.Lose)
  end
end


function GameOver.update(dt)
  local mouseX, mouseY = love.mouse.getPosition()
  
  retryButton:update(dt)
  menuButton:update(dt)
  exitButton:update(dt)
  
  if retryButton:isHovering(mouseX, mouseY) or menuButton:isHovering(mouseX, mouseY) or exitButton:isHovering(mouseX, mouseY) then
    if not Globals.hasPlayed then
      Globals.Sound:playSound(Globals.Sound.SFX.ButtonHover)
    end
  else
    Globals.hasPlayed = false
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
  love.graphics.setColor(Globals.Graphics.Colors.white)
  love.graphics.setFont(Globals.Graphics.Fonts.TitleFont)
  love.graphics.printf(GameOver.Message.text, GameOver.Message.x, GameOver.Message.y, Globals.Screen.width, "center")
  
  love.graphics.setFont(Globals.Graphics.Fonts.ScoreFont)
  love.graphics.printf(GameOver.Score.text..tostring(Globals.playerScore), GameOver.Score.x, GameOver.Score.y, Globals.Screen.width, "center")
  
  retryButton:draw()
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
