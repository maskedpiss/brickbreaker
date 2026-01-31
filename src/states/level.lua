local Level = {}

function Level.onEnter()
  Level.Text = {
      font = love.graphics.newFont(128),
      x = Globals.Screen.x,
      y = (Globals.Screen.height / 2) - 128
  }
end


function Level.update(dt)
  
end


function Level.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Level.Text.font)
  love.graphics.printf("Level "..Globals.level, Level.Text.x, Level.Text.y, Globals.Screen.width, "center")
end


function Level.onExit()
  
end

return Level
