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
  instance.color = Globals.Graphics.BrickTypes[health]
  
  return instance
end


function Brick:init(levelNumber)
  Globals.Bricks = {}
  local layout = Globals.Levels.Layouts[levelNumber]
  if not layout then return end
  
  local startX, startY = 50, 50
  local bricksPerRow = 16
  
  for i, brickType in ipairs(layout) do
    if brickType > 0 then
      local col = (i - 1) % bricksPerRow
      local row = math.floor((i - 1) / bricksPerRow)
      local x = startX + (col * (self.width + self.paddingX))
      local y = startY + (row * (self.height + self.paddingY))
      table.insert(Globals.Bricks, Brick.new(x, y, brickType))
    end
  end
end


function Brick:draw()
  for i, brick in ipairs(Globals.Bricks) do
    love.graphics.setColor(brick.color)
    love.graphics.rectangle("fill", brick.x, brick.y, brick.width, brick.height)
  end
end

return Brick
