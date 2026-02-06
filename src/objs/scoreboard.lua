local ScoreBoard = {}

function ScoreBoard.new()
  local instance = {}
  setmetatable(instance, { __index = ScoreBoard })
  
  instance.Score = {
      x = 0,
      y = 0
  }
  
  instance.Lives = {
      x = Globals.Screen.width - 200,
      y = 20,
      width = 20,
      height = 20
  }
  
  return instance
end


function ScoreBoard:update(dt)
  
end


function ScoreBoard:draw()
  love.graphics.setColor(Globals.Graphics.Colors.white)
  love.graphics.setFont(Globals.Graphics.Fonts.ButtonFont)
  love.graphics.print(Globals.playerScore, self.Score.x, self.Score.y)
  
  if Globals.playerLives > 1 then
    love.graphics.rectangle("fill", self.Lives.x, self.Lives.y, self.Lives.width, self.Lives.height)
  end
  
  if Globals.playerLives > 2 then
    love.graphics.rectangle("fill", self.Lives.x + 30, self.Lives.y, self.Lives.width, self.Lives.height)
  end
  
  if Globals.playerLives > 3 then
    love.graphics.print("x"..(Globals.playerLives - 3), self.Lives.x + 60, 10)
  end
end

return ScoreBoard
