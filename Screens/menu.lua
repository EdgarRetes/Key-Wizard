-- Menu window

-- Creates a button object using the button class in Button file
require "Classes/Button"
local startButton = Button.new((love.graphics.getWidth() - 200) / 2, (love.graphics.getHeight() +100) / 2, 200, 100, "Start Game", love.graphics.newFont(25), {0.2, 0, 0.2})

-- Draws messages and options
function draw_menu()
    love.graphics.draw(love.graphics.newImage("Maps/Main.png"))
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("KEY WIZARD", (love.graphics.getWidth() - 333) / 2, (love.graphics.getHeight()-150) / 2, 0 ,2.05, 2.05)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("KEY WIZARD", (love.graphics.getWidth() - 325) / 2, (love.graphics.getHeight()-150) / 2, 0 ,2)
    love.graphics.setColor(1, 1, 1)
    startButton:draw()
end 
  
-- Checks if the user clicked in the screen and in each position to validate any change
function update_menu(dt)
    -- Handle mouse clicks
    if love.mouse.isDown(1) then
        local mx, my = love.mouse.getPosition()
        if startButton:clicked(mx, my) then
            current_screen = "levels"
        end
    end
end

-- Returns functions to main
return {
    draw_menu = draw_menu,
    update_menu = update_menu,
}