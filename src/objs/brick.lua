local Brick = {}

Brick.width = 65
Brick.height = 20
Brick.paddingX, Brick.paddingY = 10, 10

function Brick.new(x, y, health)
  local instance = {}
  setmetatable(instance, { __index = Brick })
  
  instance.x = x
  instance.y = y
  instance.health = health
  
  return instance
end


function Brick:init(rows, cols)
  local startX, startY = 50, 50
  local brickHealth = 1
  
  for r = 0, rows - 1 do
    for c = 0, cols - 1 do
      local x = startX + (c * (self.width + self.paddingX))
      local y = startY + (r * (self.height + self.paddingY))
      
      local newBrick = Brick.new(x, y, brickHealth)
      table.insert(Globals.Bricks, newBrick)
    end
  end
end


function Brick:update(dt)
  
end


function Brick:draw()
  for i, brick in ipairs(Globals.Bricks) do
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", brick.x, brick.y, brick.width, brick.height)
  end
end

return Brick
