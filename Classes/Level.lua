-- Class Level

Level = {}
Level.__index = Level

-- Level class attributes

function Level.new(x, y, label)
    local self = setmetatable({}, Level)
    self.x = x or 0
    self.y = y or 0
    self.width = 100
    self.height = 30
    self.label = label
    self.font = love.graphics.newFont(14)
    self.color = {0.4, 0.4, 0.8, 1}
    return self
end

-- Level class methods:

function Level:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)
    
    love.graphics.setFont(self.font)
    local labelWidth = self.font:getWidth(self.label)
    local labelHeight = self.font:getHeight()
    love.graphics.print(self.label, self.x + (self.width - labelWidth) / 2, self.y + (self.height - labelHeight) / 2)

end

-- Method to check if the button is clicked
function Level:clicked(x, y)
    -- Check if the given coordinates are inside the button
    return x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.height
end

return Level