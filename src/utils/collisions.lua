local Collisions = {}

function Collisions:AABB(a, b)
  return a.x + a.width > b.x and a.x < b.x + b.width and
         a.y + a.height > b.y and a.y < b.y + b.height
end


function Collisions:checkBrickCollision(a, b)
  local overlapX, overlapY
  local direction = "vertical"
  
  if a.xVel > 0 then
    overlapX = (a.x + a.width) - b.x
  else
    overlapX = (b.x + b.width) - a.x
  end
  
  if a.yVel > 0 then
    overlapY = (a.y + a.height) - b.y
  else
    overlapY = (b.y + b.height) - a.y
  end
  
  if overlapX < overlapY then
    direction = "horizontal"
  end
  
  return direction
end

return Collisions
