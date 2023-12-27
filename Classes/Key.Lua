-- Class Key

Key = {}
Key.__index = Key

-- Creates a new key object
function Key.new(key, distance, speed, space)
    local self = setmetatable({}, Key)
    self.text = key
    self.x = distance + 25
    self.y = 13
    self.speed = speed or 0.4
    -- Loads image
    self.image = love.graphics.newImage("Characters/Key_img.png")
    self.delete = false
    self.alpha = 1
    self.space = space or false
    return self
end

function Key:update(dt)
    if self.delete then
        self.alpha = self.alpha - 0.08
    end
    -- Follows the enemy position
    self.x = self.x - self.speed 
end

function Key:draw()
    local textWidth = love.graphics.getFont():getWidth(self.text)
    if self.space then
        love.graphics.setColor(1, 1, 1, 0)
        love.graphics.draw(self.image, self.x, self.y, 0, 55/self.image:getWidth(), 55/self.image:getHeight())
        love.graphics.setColor(0, 0, 0, 0)
        love.graphics.print(self.text, self.x + textWidth, self.y + 10, 0, 2)
    else 
        -- Draws the key with its respective key to be pressed
        love.graphics.setColor(1, 1, 1, self.alpha)
        love.graphics.draw(self.image, self.x, self.y, 0, 55/self.image:getWidth(), 55/self.image:getHeight())
        love.graphics.setColor(0, 0, 0, self.alpha)
        love.graphics.print(self.text, self.x + (self.image:getWidth() - textWidth - 650) / 2 , self.y + 10, 0, 2)
        love.graphics.setColor(1, 1, 1, 1)  
    end
end

return Key