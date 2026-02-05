Globals = {}
Globals.Bricks = {}
Globals.Graphics = require("src/utils/graphics")
Globals.Collisions = require("src/utils/collisions")
Globals.Levels = require("src/utils/levels")
Globals.level = 1
Globals.playerScore = 0
Globals.playerLives = 3
Globals.playerShrunk = false
Globals.playerMissed = false
Globals.mouseVisible = nil

GameState = {
    current = nil,
    state_paths = {
        menu = "src/states/menu",
        levelTransition = "src/states/level",
        play = "src/states/play",
        gameOver = "src/states/gameover"
    },
    loaded_states = {}
}

function GameState:changeState(newState)
  if GameState.current and GameState.current.onExit then
    GameState.current.onExit()
  end
  
  if not GameState.loaded_states[newState] then
    local path = GameState.state_paths[newState]
    GameState.loaded_states[newState] = require(path)
  end
  
  GameState.current = GameState.loaded_states[newState]
  
  if GameState.current and GameState.current.onEnter then
    GameState.current.onEnter()
  end
end


function love.load()
  Globals.Screen = {
      x = 0,
      y = 0,
      width = love.graphics.getWidth(),
      height = love.graphics.getHeight()
  }
  
  Globals.Graphics:loadFonts()
  GameState:changeState("menu")
end


function love.update(dt)
  if GameState.current and GameState.current.update then
    GameState.current.update(dt)
  end
end


function love.mousepressed(x, y, button)
  if GameState.current and GameState.current.mousepressed then
    GameState.current.mousepressed(x, y, button)
  end
end


function love.draw()
  if GameState.current and GameState.current.draw then
    GameState.current.draw()
  end
  
  --love.graphics.print("Memory (KB): "..collectgarbage("count"), 10, 10)
end
