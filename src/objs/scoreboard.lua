local ScoreBoard = {}

function ScoreBoard.new()
  local instance = {}
  setmetatable(instance, { __index = ScoreBoard })
  
  instance.Score = {
      font = love.graphics.newFont(32),
      x = 0,
      y = 0
  }
  
  instance.Lives = {}
  
  return instance
end


function ScoreBoard:update(dt)
  
end


function ScoreBoard:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(self.Score.font)
  love.graphics.print(Globals.playerScore, self.Score.x, self.Score.y)
end

return ScoreBoard
