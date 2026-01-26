Globals = {}
Globals.Bricks = {}
Globals.Collisions = require("src/utils/collisions")
Globals.playerScore = 0
Globals.playerLives = 3
Globals.Paddle = nil
Globals.Ball = nil
Globals.Brick = nil
Globals.ScoreBoard = nil

GameState = {
    current = nil,
    state = {
        menu = require("src/states/menu")
    }
}

function GameState:changeState(newState)
  if GameState.current and GameState.current.onExit then
    GameState.current.onExit()
  end
  
  GameState.current = GameState.state[newState]
  
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
  
  GameState:changeState("menu")
end


function love.update(dt)
  if GameState.current and GameState.current.update then
    GameState.current.update(dt)
  end
end


function love.draw()
  if GameState.current and GameState.current.draw then
    GameState.current.draw()
  end
end
