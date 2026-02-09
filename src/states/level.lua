local Level = {}

function Level.onEnter()
  Level.Text = {
      x = Globals.Screen.x,
      y = (Globals.Screen.height / 2) - 128
  }
  
  Level.Timer = 4
  
  print("Entered Level State")
  Globals.Sound:playSong(Globals.Sound.Song.NewLevel)
end


function Level.playSong()
  Globals.Sound:playSong(Globals.Sound.Song.NewLevel)
end


function Level.update(dt)
  Level.Timer = Level.Timer - dt
  if Level.Timer <= 0 then
    GameState:changeState("play")
  end
end


function Level.draw()
  love.graphics.setColor(Globals.Graphics.Colors.white)
  love.graphics.setFont(Globals.Graphics.Fonts.TitleFont)
  love.graphics.printf("LEVEL "..Globals.level, Level.Text.x, Level.Text.y, Globals.Screen.width, "center")
end


function Level.onExit()
  Level.Text = nil
  Level.Timer = nil
end

return Level
