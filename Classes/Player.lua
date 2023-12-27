-- Class Player

Player = {}
Player.__index = Player

-- Player class attributes
function Player.new()
    local self = setmetatable({}, Player)
    self.x = 50
    self.y = 318
    self.width = 100
    self.height = 160
    self.label = "Player"
    self.animation1 = love.graphics.newImage("Characters/HalflingAssassinIdleSideRun1.png")
    self.animation2 = love.graphics.newImage("Characters/HalflingAssassinIdleSideRun2.png")
    self.animation3 = love.graphics.newImage("Characters/HalflingAssassinIdleSideAction.png")
    self.action = false
    self.currentAnimation = self.animation1
    self.animationTimer = 0
    self.animationDelay = 0.4  -- Speed between images
    return self
end

function Player:update(dt)
    self.animationTimer = self.animationTimer + dt

    if self.action then
        -- Check if the action duration has passed
        if self.animationTimer >= self.animationDelay then
            self.action = false  -- Set self.action to false
            self.animationTimer = 0  -- Reset the action timer
            self.currentAnimation = self.animation1  -- Switch back to default animation
        else
            -- Set the current animation to the action animation only once
            self.currentAnimation = self.animation3
        end
    else
        if self.animationTimer >= self.animationDelay then
            if self.currentAnimation == self.animation1 then
                self.currentAnimation = self.animation2
            elseif self.currentAnimation == self.animation2 then
                self.currentAnimation = self.animation1
            end
            self.animationTimer = 0  -- Reset the timer
        end
    end
end


-- Draw player
function Player:draw()
    love.graphics.draw(self.currentAnimation, self.x, self.y, 0, self.width / self.currentAnimation:getWidth(), self.height / self.currentAnimation:getHeight())
end

function Player:checkCollision(enemy)
    if self.x < enemy.x + enemy.width and
       self.x + self.width > enemy.x and
       self.y < enemy.y + enemy.height and
       self.y + self.height > enemy.y then
        return true  -- The player touches an enemy
    end
end

return Player
