local Menu = {}

local button = nil

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
  button = Globals.Button.new("Button", Globals.Screen.width / 2, Globals.Screen.height / 2)
end


function Menu.update(dt)
  
end


function Menu.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Menu.Title.font)
  love.graphics.printf(Menu.Title.text, Menu.Title.x, Menu.Title.y, Globals.Screen.width, "center")
  
  button:draw()
end


function Menu.onExit()
  
end

return Menu
