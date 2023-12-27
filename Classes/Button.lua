-- Class Button

Button = {}
Button.__index = Button

-- Button class attributes
function Button.new(x, y, width, height, label, font, color)
    local self = setmetatable({}, Button)
    self.x = x or 0
    self.y = y or 0
    self.width = width or 100
    self.height = height or 30
    self.label = label or "Button"
    self.font = font or love.graphics.newFont(14)
    self.color = color or {0.4, 0.4, 0.8, 1}
    return self
end

-- Button methods


-- Method to draw the button
function Button:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1)

    -- Draw the button label
    love.graphics.setFont(self.font)
    local labelWidth = self.font:getWidth(self.label)
    local labelHeight = self.font:getHeight()
    love.graphics.print(self.label, self.x + (self.width - labelWidth) / 2, self.y + (self.height - labelHeight) / 2)
    
end


-- Method to check if the button is clicked
function Button:clicked(x, y)
    -- Check if the given coordinates are inside the button
    return x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.height
end

return Button