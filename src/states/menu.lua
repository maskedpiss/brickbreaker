local Menu = {}

local playButton = nil
local exitButton = nil

function Menu.onEnter()
  Globals.mouseVisible = true
  love.mouse.setVisible(Globals.mouseVisible)
  
  Menu.Title = {
      font = love.graphics.newFont(128),
      text = "Brick Breaker",
      x = Globals.Screen.x,
      y = 50
  }
  
  Globals.Button = require("src/objs/button")
  playButton = Globals.Button.new("Play", Globals.Screen.width / 2, Globals.Screen.height / 2, function()
      GameState:changeState("play")
    end)
  
  exitButton = Globals.Button.new("Exit", Globals.Screen.width / 2, (Globals.Screen.height / 2) + 100, function()
      love.event.quit()
    end)
end


function Menu.update(dt)
  
end


function Menu.mousepressed(x, y, button)
  
end


function Menu.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Menu.Title.font)
  love.graphics.printf(Menu.Title.text, Menu.Title.x, Menu.Title.y, Globals.Screen.width, "center")
  
  playButton:draw()
  exitButton:draw()
end


function Menu.onExit()
  
end

return Menu
