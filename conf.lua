function love.conf(t)
    t.identity = "brick_breaker"
    t.version = "11.5"
    
    t.window.title = "Brick Breaker"
    t.window.width = 1280
    t.window.height = 720
    t.window.vsync = 1
    t.window.resizable = false
    t.window.highdpi = true
    
    t.modules.physics = false
    t.modules.joystick = false
end
