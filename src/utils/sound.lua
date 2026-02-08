local Sound = {}

function Sound:loadSFX()
  self.SFX = {
      ButtonClick = love.audio.newSource("res/sound/sfx/ButtonClick.wav", "static"),
      ButtonHover = love.audio.newSource("res/sound/sfx/ButtonHover.wav", "static"),
      HitCeiling = love.audio.newSource("res/sound/sfx/HitCeiling.wav", "static"),
      HitPaddle = love.audio.newSource("res/sound/sfx/HitPaddle1.wav", "static"),
      Pause = love.audio.newSource("res/sound/sfx/Pause.wav", "static"),
      BrickBreak = love.audio.newSource("res/sound/sfx/BrickBreak.wav", "static"),
      BrickDamage = love.audio.newSource("res/sound/sfx/BrickDamage.wav", "static"),
      PaddleShorten = love.audio.newSource("res/sound/sfx/PaddleShorten.wav", "static"),
      LoseLife = love.audio.newSource("res/sound/sfx/LoseLife.wav", "static")
  }
end


function Sound:loadMusic()
  self.Song = {}
end


function Sound:playSound(sound)
  love.audio.stop()
  love.audio.play(sound)
  Globals.hasPlayed = true
end

return Sound
