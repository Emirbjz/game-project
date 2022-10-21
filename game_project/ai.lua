AI = {}

function AI:load()
    self.img = love.graphics.newImage("assets/2.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.x = love.graphics.getWidth() - self.width - 50
    self.y = love.graphics.getHeight() / 2.5
    self.yvel = 0
    self.speed = 500

    self.timer = 0
    self.rate = 0.75

end

function AI:update(dt)
    self:move(dt)
    self.timer = self.timer + dt
    if self.timer > self.rate then 
       self.timer = 0
       self:target()
    end


end

function AI:move(dt)
    self.y = self.y + self.yvel * dt

end

function AI:target()
    if Ball.y + Ball.height < self.y then
        self.yvel = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yvel = self.speed
    else
        self.yvel = 0
    end
end

function AI:draw()
    love.graphics.draw(self.img, self.x, self.y)

end
