-- Class Life

Life = {}
Life.__index = Life

-- Creates a new key object
function Life.new(x, y)
    local self = setmetatable({}, Life)
    self.x = x
    self.y = y
    -- Loads image
    self.image = love.graphics.newImage("Characters/Heart.png")
    return self
end


function Life:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, 55/self.image:getWidth(), 55/self.image:getHeight())
end

return Life