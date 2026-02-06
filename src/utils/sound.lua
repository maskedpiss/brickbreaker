local Sound = {}

function Sound:loadSFX()
  self.SFX = {
      ButtonClick = love.audio.newSource("res/sound/sfx/ButtonClick.wav", "static"),
      ButtonHover = love.audio.newSource("res/sounds/sfx/ButtonHover.wav", "static"),
      HitCeiling = love.auido.newSource("res/sounds/sfx/HitCeiling.wav", "static"),
      HitPaddle = love.audio.newSource("res/sounds/sfx/HitPaddle1.wav", "static")
  }
end

return Sound
