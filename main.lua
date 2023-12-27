-- CS50 Final Project

-- Sets default current screen to menu 
current_screen = "menu"

-- Include the screen files
local menu = require "Screens/menu"
local level_selector = require "Screens/levels"
local level_1 = require "Levels/level_1"
local level_2 = require "Levels/level_2"
local level_3 = require "Levels/level_3"
local level_4 = require "Levels/level_4"
local level_5 = require "Levels/level_5"
local level_6 = require "Levels/level_6"
local level_7 = require "Levels/level_7"
local level_8 = require "Levels/level_8"
local level_9 = require "Levels/level_9"
local level_10 = require "Levels/level_10"
local level_11 = require "Levels/level_11"
local level_12 = require "Levels/level_12"
local level_13 = require "Levels/level_13"
local level_14 = require "Levels/level_14"
local level_15 = require "Levels/level_15"
local level_16 = require "Levels/level_16"
local level_17 = require "Levels/level_17"
local level_18 = require "Levels/level_18"

-- Simple tiled include from github: https://github.com/karai17/Simple-Tiled-Implementation
local sti = require "lib/sti"

-- Variable for music
local theme = {}
theme.music = love.audio.newSource("Sound/MainTheme.mp3", "stream")
theme.music:setLooping(true)

-- Loading of maps
function love.load()
  love.window.setTitle("Key Wizard")
  mlevel_1 = sti('Maps/Level_1.lua')
  mlevel_2 = sti('Maps/Level_2.lua')
  mlevel_3 = sti('Maps/Level_3.lua')
  mlevel_4 = sti('Maps/Level_4.lua')
  mlevel_5 = sti('Maps/Level_5.lua')
  mlevel_6 = sti('Maps/Level_6.lua')
  mlevel_7 = sti('Maps/Level_7.lua')
  mlevel_8 = sti('Maps/Level_8.lua')
  mlevel_9 = sti('Maps/Level_9.lua')
  mlevel_10 = sti('Maps/Level_10.lua')
  mlevel_11 = sti('Maps/Level_11.lua')
  mlevel_12 = sti('Maps/Level_12.lua')
  mlevel_13 = sti('Maps/Level_14.lua')
  mlevel_14 = sti('Maps/Level_21.lua')
  mlevel_15 = sti('Maps/Level_22.lua')
  mlevel_16 = sti('Maps/Level_19.lua')
  mlevel_17 = sti('Maps/Level_24.lua')
  mlevel_18 = sti('Maps/Level_25.lua')

  level_1.load_level_1()
  level_2.load_level_2()
  level_3.load_level_3()
  level_4.load_level_4()
  level_5.load_level_5()
  level_6.load_level_6()
  level_7.load_level_7()
  level_8.load_level_8()
  level_9.load_level_9()
  level_10.load_level_10()
  level_11.load_level_11()
  level_12.load_level_12()
  level_13.load_level_13()
  level_14.load_level_14()
  level_15.load_level_15()
  level_16.load_level_16()
  level_17.load_level_17()
  level_18.load_level_18()
end

-- Draws the elements for each screen
function love.draw()
  if current_screen == "menu" then
    menu.draw_menu()
  elseif current_screen == "levels" then
    level_selector.draw_level_selector()
  elseif current_screen == "level_1" then
    level_1.draw_level_1()
  elseif current_screen == "level_2" then
    level_2.draw_level_2()
  elseif current_screen == "level_3" then
    level_3.draw_level_3()
  elseif current_screen == "level_4" then
    level_4.draw_level_4()
  elseif current_screen == "level_5" then
    level_5.draw_level_5()
  elseif current_screen == "level_6" then
    level_6.draw_level_6()
  elseif current_screen == "level_7" then
    level_7.draw_level_7()
  elseif current_screen == "level_8" then
    level_8.draw_level_8()
  elseif current_screen == "level_9" then
    level_9.draw_level_9() 
  elseif current_screen == "level_10" then
    level_10.draw_level_10() 
  elseif current_screen == "level_11" then
    level_11.draw_level_11() 
  elseif current_screen == "level_12" then
    level_12.draw_level_12()
  elseif current_screen == "level_13" then
    level_13.draw_level_13()
  elseif current_screen == "level_14" then
    level_14.draw_level_14()
  elseif current_screen == "level_15" then
    level_15.draw_level_15()
  elseif current_screen == "level_16" then
    level_16.draw_level_16()
  elseif current_screen == "level_17" then
    level_17.draw_level_17()
  elseif current_screen == "level_18" then
    level_18.draw_level_18()
  end

end

-- Updates for each screen
function love.update(dt)
  if current_screen == "menu" or current_screen == "levels" then
    if not theme.music:isPlaying() then
      theme.music:play()
    end
  else
    theme.music:stop()
  end

  if current_screen == "menu" then
    menu.update_menu(dt)
  elseif current_screen == "levels" then
    level_selector.update_level_selector(dt)
  elseif current_screen == "level_1" then
    level_1.update_level_1(dt)
  elseif current_screen == "level_2" then
    level_2.update_level_2(dt)
  elseif current_screen == "level_3" then
    level_3.update_level_3(dt)
  elseif current_screen == "level_4" then
    level_4.update_level_4(dt)
  elseif current_screen == "level_5" then
    level_5.update_level_5(dt)
  elseif current_screen == "level_6" then
    level_6.update_level_6(dt)
  elseif current_screen == "level_7" then
    level_7.update_level_7(dt)
  elseif current_screen == "level_8" then
    level_8.update_level_8(dt)
  elseif current_screen == "level_9" then
    level_9.update_level_9(dt) 
  elseif current_screen == "level_10" then
    level_10.update_level_10(dt) 
  elseif current_screen == "level_11" then
    level_11.update_level_11(dt)
  elseif current_screen == "level_12" then
    level_12.update_level_12(dt)
  elseif current_screen == "level_13" then
    level_13.update_level_13(dt)
  elseif current_screen == "level_14" then
    level_14.update_level_14(dt)
  elseif current_screen == "level_15" then
    level_15.update_level_15(dt)
  elseif current_screen == "level_16" then
    level_16.update_level_16(dt)
  elseif current_screen == "level_17" then
    level_17.update_level_17(dt)
  elseif current_screen == "level_18" then
    level_18.update_level_18(dt)
  end
end


function love.keypressed(key)
  if current_screen == "level_1" then
    level_1.keypressed(key)
  elseif current_screen == "level_2" then
    level_2.keypressed_2(key)
  elseif current_screen == "level_3" then
    level_3.keypressed_3(key)
  elseif current_screen == "level_4" then
    level_4.keypressed_4(key)
  elseif current_screen == "level_5" then
    level_5.keypressed_5(key)
  elseif current_screen == "level_6" then
    level_6.keypressed_6(key)
  elseif current_screen == "level_7" then
    level_7.keypressed_7(key)
  elseif current_screen == "level_8" then
    level_8.keypressed_8(key)
  elseif current_screen == "level_9" then
    level_9.keypressed_9(key)
  elseif current_screen == "level_10" then
    level_10.keypressed_10(key)
  elseif current_screen == "level_11" then
    level_11.keypressed_11(key)
  elseif current_screen == "level_12" then
    level_12.keypressed_12(key)
  elseif current_screen == "level_13" then
    level_13.keypressed_13(key)
  elseif current_screen == "level_14" then
    level_14.keypressed_14(key)
  elseif current_screen == "level_15" then
    level_15.keypressed_15(key)
  elseif current_screen == "level_16" then
    level_16.keypressed_16(key)
  elseif current_screen == "level_17" then
    level_17.keypressed_17(key)
  elseif current_screen == "level_18" then
    level_18.keypressed_18(key)
  end
end

function love.keyreleased(key)
  if current_screen == "level_1" then
    level_1.keyreleased(key)
  elseif current_screen == "level_2" then
    level_2.keyreleased_2(key)
  elseif current_screen == "level_3" then
    level_3.keyreleased_3(key)
  elseif current_screen == "level_4" then
    level_4.keyreleased_4(key)
  elseif current_screen == "level_5" then
    level_5.keyreleased_5(key)
  elseif current_screen == "level_6" then
    level_6.keyreleased_6(key)
  elseif current_screen == "level_7" then
    level_7.keyreleased_7(key)
  elseif current_screen == "level_8" then
    level_8.keyreleased_8(key)
  elseif current_screen == "level_9" then
    level_9.keyreleased_9(key)
  elseif current_screen == "level_10" then
    level_10.keyreleased_10(key)
  elseif current_screen == "level_11" then
    level_11.keyreleased_11(key)
  elseif current_screen == "level_12" then
    level_12.keyreleased_12(key)
  elseif current_screen == "level_13" then
    level_13.keyreleased_13(key)
  elseif current_screen == "level_14" then
    level_14.keyreleased_14(key)
  elseif current_screen == "level_15" then
    level_15.keyreleased_15(key)
  elseif current_screen == "level_16" then
    level_16.keyreleased_16(key)
  elseif current_screen == "level_17" then
    level_17.keyreleased_17(key)
  elseif current_screen == "level_18" then
    level_18.keyreleased_18(key)
  end
end
