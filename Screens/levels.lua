-- Levels window

-- Creates a level object that works as a button
require "Classes/Level"
local level_1 = Level.new(40, 100, "F & J")
local level_2 = Level.new(150, 100, "D & K")
local level_3 = Level.new(260, 100, "S & L")
local level_4 = Level.new(370, 100, "A & .")
local level_5 = Level.new(480, 100, "G & H")
local level_6 = Level.new(590, 100, "MIDDLE")
local level_7 = Level.new(40, 200, "R & U")
local level_8 = Level.new(150, 200, "E & I")
local level_9 = Level.new(260, 200, "W & O")
local level_10 = Level.new(370, 200, "Q & P")
local level_11 = Level.new(480, 200, "T & Y")
local level_12 = Level.new(590, 200, "TOP")
local level_13 = Level.new(40, 300, "V & B")
local level_14 = Level.new(150, 300, "C & N")
local level_15 = Level.new(260, 300, "X & M")
local level_16 = Level.new(370, 300, "Z & ,")
local level_17 = Level.new(480, 300, "BOTTOM")
local level_18 = Level.new(40, 400, "FINAL")

-- Draws the level objects in the screen
function draw_level_selector()
  love.graphics.draw(love.graphics.newImage("Maps/Main.png"))
  level_1:draw()
  level_2:draw()
  level_3:draw()
  level_4:draw()
  level_5:draw()
  level_6:draw()
  level_7:draw()
  level_8:draw()
  level_9:draw()
  level_10:draw()
  level_11:draw()
  level_12:draw()
  level_13:draw()
  level_14:draw()
  level_15:draw()
  level_16:draw()
  level_17:draw()
  level_18:draw()
end

-- Cj¿hecks if the user selects a level
function update_level_selector(dt)
  if love.mouse.isDown(1) then
    local mx, my = love.mouse.getPosition()
    if level_1:clicked(mx, my) then
      current_screen = "level_1"
    elseif level_2:clicked(mx, my) then
      current_screen = "level_2"
    elseif level_3:clicked(mx, my) then
      current_screen = "level_3"
    elseif level_4:clicked(mx, my) then
      current_screen = "level_4"
    elseif level_5:clicked(mx, my) then
        current_screen = "level_5"
    elseif level_6:clicked(mx, my) then
        current_screen = "level_6"
    elseif level_7:clicked(mx, my) then
        current_screen = "level_7"
    elseif level_8:clicked(mx, my) then
        current_screen = "level_8"
    elseif level_9:clicked(mx, my) then
        current_screen = "level_9"
    elseif level_10:clicked(mx, my) then
        current_screen = "level_10"
    elseif level_11:clicked(mx, my) then
        current_screen = "level_11"
    elseif level_12:clicked(mx, my) then
        current_screen = "level_12"
    elseif level_13:clicked(mx, my) then
        current_screen = "level_13"
    elseif level_14:clicked(mx, my) then
        current_screen = "level_14"
    elseif level_15:clicked(mx, my) then
        current_screen = "level_15"
    elseif level_16:clicked(mx, my) then
        current_screen = "level_16"
    elseif level_17:clicked(mx, my) then
        current_screen = "level_17"
    elseif level_18:clicked(mx, my) then
        current_screen = "level_18"
    end
  end
end

-- Returns functions to main
return {
  draw_level_selector = draw_level_selector,
  update_level_selector = update_level_selector,
}