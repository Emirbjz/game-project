Ball = {}

function Ball:load()
   self.x = love.graphics.getWidth() / 2
   self.y = love.graphics.getHeight() / 2
   self.img = love.graphics.newImage("assets/ball.png")
   self.width = self.img:getWidth()
   self.height = self.img:getHeight()
   self.speed = 200
   self.xvel = -self.speed
   self.yvel = 0

end

function Ball:update(dt)
    self:move(dt)
    self:collide()
    self:score()
   
end

function Ball:collide()
    if checkcollision(self, Player) then
        self.xvel = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer =  Player.y + Player.height / 2
        local CollisionPosition = middleBall - middlePlayer
        self.yvel = CollisionPosition * 5
    end
    if checkcollision(self, AI) then
        self.xvel = -self.speed
        local middleBall = self.y + self.height / 2
        local middleAI =  AI.y + AI.height / 2
        local CollisionPosition = middleBall - middleAI
        self.yvel = CollisionPosition * 5
    end


    if self.y < 0 then
        self.y = 0
        self.yvel = -self.yvel
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yvel = -self.yvel
    end
end


function Ball:score()
    if self.x < 0 then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yvel = 0
        self.xvel = self.speed
        Score.ai = Score.ai + 1
    end
    if self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yvel = 0
        self.xvel = -self.speed
        Score.player = Score.player + 1
    end



end

function Ball:move(dt)
    self.x = self.x + self.xvel * dt
    self.y = self.y + self.yvel * dt

end


function Ball:draw()
    love.graphics.draw(self.img, self.x, self.y)
  

end