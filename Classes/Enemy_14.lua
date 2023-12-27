-- Class Enemy 14   

Enemy_14 = {}
Enemy_14.__index = Enemy_14

-- Enemy_10 class attributes
function Enemy_14.new(distance, shadow, speed)
    local self = setmetatable({}, Enemy_14)
    self.x = distance
    self.y = 312
    self.width = 100
    self.height = 160
    self.animation1 = love.graphics.newImage("Characters/GnollPikemanIdle2Side1.png")
    self.animation2 = love.graphics.newImage("Characters/GnollPikemanIdle2Side2.png")
    self.speed = speed or 0.4
    self.currentAnimation = self.animation1
    self.animationTimer = 0
    self.animationDelay = 0.2  -- Speed between images
    self.alive = true
    self.alpha = 1
    self.shadow = shadow or false
    return self
end

function Enemy_14:update(dt)

    self.animationTimer = self.animationTimer + dt

    -- Follows the order of images to set the animation
    if self.animationTimer >= self.animationDelay then
        if self.currentAnimation == self.animation1 then
            self.currentAnimation = self.animation2
        elseif self.currentAnimation == self.animation2 then
            self.currentAnimation = self.animation1
        end

        self.animationTimer = 0  -- Reset the timer
    end

    if self.alive == false then
        self.alpha = self.alpha - .075
    end
    self.x = self.x - self.speed

end

-- Draw enemy
function Enemy_14:draw()
    if self.shadow then
        love.graphics.setColor(0.1, 0.2, 0.2, self.alpha)
        love.graphics.draw(self.currentAnimation, self.x, self.y, 0, self.width / self.currentAnimation:getWidth(), self.height / self.currentAnimation:getHeight())
        love.graphics.setColor(1, 1, 1, 1)
    else
        love.graphics.setColor(1, 1, 1, self.alpha)
        love.graphics.draw(self.currentAnimation, self.x, self.y, 0, self.width / self.currentAnimation:getWidth(), self.height / self.currentAnimation:getHeight())
        love.graphics.setColor(1, 1, 1, 1)  
    end
end

return Enemy_14