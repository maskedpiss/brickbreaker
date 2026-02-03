local Level = {}

function Level.onEnter()
  Level.Text = {
      font = love.graphics.newFont(128),
      x = Globals.Screen.x,
      y = (Globals.Screen.height / 2) - 128
  }
  
  Level.Timer = 4
end


function Level.update(dt)
  Level.Timer = Level.Timer - dt
  if Level.Timer <= 0 then
    GameState:changeState("play")
  end
end


function Level.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(Level.Text.font)
  love.graphics.printf("Level "..Globals.level, Level.Text.x, Level.Text.y, Globals.Screen.width, "center")
end


function Level.onExit()
  Level.Text = nil
  Level.Timer = nil
end

return Level
