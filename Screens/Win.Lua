-- Winning Window

-- Creates the button objects using the button class in Button file
require "Classes/Button"
local next_lvl = Button.new((love.graphics.getWidth() - 250) / 2, (love.graphics.getHeight() - 75) / 2, 250, 75, "Next Level", love.graphics.newFont(24), {0.4, 0.3, 0.4})
local return_btn = Button.new((love.graphics.getWidth() - 250) / 2, (love.graphics.getHeight()+100) / 2, 250, 75, "Return", love.graphics.newFont(24), {0.4, 0.3, 0.4})

-- Creates the winning screen
function draw_win(precision)
    love.graphics.setColor(0.2, .1, 0)
    love.graphics.rectangle("fill", (love.graphics.getWidth() - 600) / 2,  (love.graphics.getHeight() - 450) / 2, 600, 450)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setColor(0.8, 0.7, 0.5)
    love.graphics.rectangle("fill", (love.graphics.getWidth() - 550) / 2,  (love.graphics.getHeight() - 400) / 2, 550, 400)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setColor(0, 0, 0)
    local font = love.graphics.newFont(54)
    love.graphics.setFont(font)
    love.graphics.print("YOU WON!", (love.graphics.getWidth() - font:getWidth("YOU WON!")) / 2, (love.graphics.getHeight() - 300) / 2)
    love.graphics.setFont(love.graphics.newFont())
    love.graphics.setFont(love.graphics.newFont(20))
    local precision_2 = string.format("%.2f", precision)
    love.graphics.print("Precision: %" .. precision_2, ((love.graphics.getWidth() - font:getWidth("Precision: %" .. precision_2)) / 2) + 150, (love.graphics.getHeight() - 150) / 2)
    love.graphics.setFont(love.graphics.newFont())
    love.graphics.setColor(1, 1, 1)
    next_lvl:draw()
    return_btn:draw()
    love.graphics.setFont(love.graphics.newFont())

end

function update_win(dt, nxt_level, reset_level)
    -- Handle mouse clicks for buttons
    if love.mouse.isDown(1) then
        local mx, my = love.mouse.getPosition()
        if next_lvl:clicked(mx, my) then
            reset_level()
            current_screen = nxt_level
        elseif return_btn:clicked(mx, my) then
            reset_level()
            current_screen = "levels"
        end
    end
end

-- Returns functions
return {
    draw_win = draw_win,
    update_win = update_win,
}