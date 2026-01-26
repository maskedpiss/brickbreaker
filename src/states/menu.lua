local Menu = {}

function Menu.onEnter()
  Globals.mouseVisible = true
  love.mouse.setVisible(Globals.mouseVisible)
  
  Menu.Title = {
      font = love.graphics.newFont(128),
      text = "Brick Breaker",
      x = Globals.Screen.x,
      y = 50
  }
end


function Menu.update(dt)
  
end


function Menu.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Menu.Title.font)
  love.graphics.printf(Menu.Title.text, Menu.Title.x, Menu.Title.y, Globals.Screen.width, "center")
end


function Menu.onExit()
  
end

return Menu
