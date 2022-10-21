require("player")
require("ball")
require("ai")
require("background")

function love.load()
    Player:load()
    Ball:load()
    AI:load()
    Background:load()

    Score = {player = 0, ai = 0}

end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    AI:update(dt)
    Background:update(dt)
end


function love.draw()
    Background:draw()
    Player:draw()
    Ball:draw()
    AI:draw()
    love.graphics.print("Player: "..Score.player, 50, 50)
    love.graphics.print("AI: "..Score.ai, 700, 50)
    love.graphics.print ("Use W and S to move", 350, 50)

end

function checkcollision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y + b.height then
        return true
    else
        return false
    end

end