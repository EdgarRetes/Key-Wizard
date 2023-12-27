-- Level 1 screen

-- x variable for map displaying
local x
-- Player variable
local player
-- Adding Life class
local life = require "Classes/Life"
-- Table to store lives
local lives
-- Adding enemy_1 class
local Enemy_1 = require "Classes/Enemy_1"
-- Table to store enemies in level 1
local enemies
-- Table with the keys that need to be pressed
local keys
-- Adding Key class
local Key = require "Classes/Key"
-- Table of key objects
local key_obj
-- Variables for game over window
local GameOver = require "Screens/GameOver"
local gamestatus
-- Variables for winning window
local Win1 = require "Screens/Win"
local completed
local win_sound
-- Image of fingers positioning
local spells
local fingers
local alpha_img
-- Message from tutorial
local message
local aux_mess
local timer_fade
-- Variables for key pressing events
local key_pressed
local key_released
local key_pressed_time
-- Variable for sounds
local sounds
-- Variebles to keep track of the keys pressed wrongly
local misses
local precision
local num_keys
local presses

-- Load function for main
function load_level_1()
    x = 0
    player = require "Classes/Player".new()
    lives = {}
    table.insert(lives, life.new(30, 80))
    table.insert(lives, life.new(70, 80))
    table.insert(lives, life.new(110, 80))
    enemies = {}
    keys = {"f", "j", "space", "f", "j", "space", "space", "j", "f", "f", "f", "f", "space", "j", "j", "j", "space", "j", "space", "f", "space", "f", "space", "j", "space", "j", "j", "f", "space", "f", "f", "j", "space", "f", "space", "f", "j", "space", "f", "f", "space", "space", "f", "j", "f", "f", "j", "j", "space", "f", "j", "space", "f", "j", "f", "f", "j", "j", "f", "j", "j", "f", "f", "j", "space", "f", "space", "j"}
    key_obj = {}
    alpha_img = 1
    message = "Shadow enemies are vanished with spacebar spell!"
    aux_mess = 0
    timer_fade = 0
    completed = false
    misses = 0
    precision = 100
    presses = 0
    num_keys = #keys
    win_sound = false
    sounds = {}
    sounds.music = love.audio.newSource("Sound/LevelMusic.mp3", "stream")
    sounds.go = love.audio.newSource("Sound/GameOver.wav", "static")
    sounds.win = love.audio.newSource("Sound/Win.wav", "static")
    sounds.spell = love.audio.newSource("Sound/Spell.mp3", "static")
    sounds.spell:setPitch(3.5)
    sounds.shadow = love.audio.newSource("Sound/Shadow.wav", "static")
    sounds.shadow:setPitch(2)
    sounds.shadow:setVolume(0.2)
    sounds.enemy = love.audio.newSource("Sound/EnemySound.mp3", "static")
    sounds.enemy:setPitch(2)
    sounds.enemy:setVolume(0.2)
    sounds.collision = love.audio.newSource("Sound/Collision.mp3", "static")
    sounds.collision:setVolume(0.3)
    -- Status for the game (Playing/GameOver)
    gamestatus = true

    spells = love.graphics.newImage("Characters/Hechizos.png")
    fingers = love.graphics.newImage("Characters/Finger Position.png")
    -- Create Enemy_1 instances and add them to the 'enemies' table
    table.insert(enemies, Enemy_1.new(800))
    table.insert(enemies, Enemy_1.new(1000))
    table.insert(enemies, Enemy_1.new(1200, true))

    table.insert(enemies, Enemy_1.new(3600, false, 1.5))
    table.insert(enemies, Enemy_1.new(3800, false, 1.5))
    table.insert(enemies, Enemy_1.new(4000, true, 1.5))

    table.insert(enemies, Enemy_1.new(4400, true, 1.5))
    table.insert(enemies, Enemy_1.new(4600, false, 1.5))
    table.insert(enemies, Enemy_1.new(4800, false, 1.5))

    table.insert(enemies, Enemy_1.new(5200, false, 1.5))
    table.insert(enemies, Enemy_1.new(5300, false, 1.5))
    table.insert(enemies, Enemy_1.new(5400, false, 1.5))
    table.insert(enemies, Enemy_1.new(5500, true, 1.5))

    table.insert(enemies, Enemy_1.new(5800, false, 1.5))
    table.insert(enemies, Enemy_1.new(5900, false, 1.5))
    table.insert(enemies, Enemy_1.new(6000, false, 1.5))
    table.insert(enemies, Enemy_1.new(6100, true, 1.5))

    table.insert(enemies, Enemy_1.new(6500, false, 1.5))
    table.insert(enemies, Enemy_1.new(6600, true, 1.5))
    table.insert(enemies, Enemy_1.new(6700, false, 1.5))
    table.insert(enemies, Enemy_1.new(6800, true, 1.5))

    table.insert(enemies, Enemy_1.new(7200, false, 1.5))
    table.insert(enemies, Enemy_1.new(7300, true, 1.5))
    table.insert(enemies, Enemy_1.new(7400, false, 1.5))
    table.insert(enemies, Enemy_1.new(7500, true, 1.5))

    table.insert(enemies, Enemy_1.new(16000, false, 3))
    table.insert(enemies, Enemy_1.new(16100, false, 3))
    table.insert(enemies, Enemy_1.new(16200, false, 3))
    table.insert(enemies, Enemy_1.new(16300, true, 3))
    table.insert(enemies, Enemy_1.new(16400, false, 3))
    table.insert(enemies, Enemy_1.new(16500, false, 3))
    table.insert(enemies, Enemy_1.new(16600, false, 3))
    table.insert(enemies, Enemy_1.new(16700, true, 3))

    table.insert(enemies, Enemy_1.new(17100, false, 3))
    table.insert(enemies, Enemy_1.new(17200, true, 3))
    table.insert(enemies, Enemy_1.new(17300, false, 3))
    table.insert(enemies, Enemy_1.new(17400, false, 3))
    table.insert(enemies, Enemy_1.new(17500, true, 3))
    table.insert(enemies, Enemy_1.new(17600, false, 3))
    table.insert(enemies, Enemy_1.new(17800, false, 3))

    table.insert(enemies, Enemy_1.new(18200, true, 3))
    table.insert(enemies, Enemy_1.new(18300, true, 3))
    table.insert(enemies, Enemy_1.new(18400, false, 3))
    table.insert(enemies, Enemy_1.new(18500, false, 3))
    table.insert(enemies, Enemy_1.new(18600, false, 3))
    table.insert(enemies, Enemy_1.new(18700, false, 3))
    table.insert(enemies, Enemy_1.new(18800, false, 3))
    table.insert(enemies, Enemy_1.new(18900, false, 3))
    table.insert(enemies, Enemy_1.new(19000, true, 3))

    table.insert(enemies, Enemy_1.new(19500, false, 3))
    table.insert(enemies, Enemy_1.new(19600, false, 3))
    table.insert(enemies, Enemy_1.new(19800, true, 3))
    table.insert(enemies, Enemy_1.new(20000, false, 3))
    table.insert(enemies, Enemy_1.new(20100, false, 3))


    table.insert(enemies, Enemy_1.new(20500, false, 3))
    table.insert(enemies, Enemy_1.new(20600, false, 3))
    table.insert(enemies, Enemy_1.new(20700, false, 3))
    table.insert(enemies, Enemy_1.new(20800, false, 3))


    table.insert(enemies, Enemy_1.new(21000, false, 3))
    table.insert(enemies, Enemy_1.new(21100, false, 3))
    table.insert(enemies, Enemy_1.new(21200, false, 3))
    table.insert(enemies, Enemy_1.new(21300, false, 3))
    table.insert(enemies, Enemy_1.new(21400, false, 3))
    table.insert(enemies, Enemy_1.new(21500, false, 3))
    table.insert(enemies, Enemy_1.new(21600, true, 3))
    table.insert(enemies, Enemy_1.new(21700, false, 3))
    table.insert(enemies, Enemy_1.new(21900, true, 3))
    table.insert(enemies, Enemy_1.new(22000, false, 3))

    -- Create Key objects and add them to 'key_obj' table
    table.insert(key_obj, Key.new(string.upper(keys[1]), 800))
    table.insert(key_obj, Key.new(string.upper(keys[2]), 1000))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[4]), 3600, 1.5))
    table.insert(key_obj, Key.new(string.upper(keys[5]), 3800, 1.5))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[8]), 4600, 1.5))
    table.insert(key_obj, Key.new(string.upper(keys[9]), 4800, 1.5))

    table.insert(key_obj, Key.new(string.upper(keys[10]), 5200, 1.5))
    table.insert(key_obj, Key.new(string.upper(keys[11]), 5300, 1.5))
    table.insert(key_obj, Key.new(string.upper(keys[12]), 5400, 1.5))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[14]), 5800, 1.5))
    table.insert(key_obj, Key.new(string.upper(keys[15]), 5900, 1.5))
    table.insert(key_obj, Key.new(string.upper(keys[16]), 6000, 1.5))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[18]), 6500, 1.5))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[20]), 6700, 1.5))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[22]), 7200, 1.5))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[24]), 7400, 1.5))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[26]), 16000, 3))
    table.insert(key_obj, Key.new(string.upper(keys[27]), 16100, 3))
    table.insert(key_obj, Key.new(string.upper(keys[28]), 16200, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[30]), 16400, 3))
    table.insert(key_obj, Key.new(string.upper(keys[31]), 16500, 3))
    table.insert(key_obj, Key.new(string.upper(keys[32]), 16600, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[34]), 17100, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[36]), 17300, 3))
    table.insert(key_obj, Key.new(string.upper(keys[37]), 17400, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[39]), 17600, 3))
    table.insert(key_obj, Key.new(string.upper(keys[40]), 17800, 3))

    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[43]), 18400, 3))
    table.insert(key_obj, Key.new(string.upper(keys[44]), 18500, 3))
    table.insert(key_obj, Key.new(string.upper(keys[45]), 18600, 3))
    table.insert(key_obj, Key.new(string.upper(keys[46]), 18700, 3))
    table.insert(key_obj, Key.new(string.upper(keys[47]), 18800, 3))
    table.insert(key_obj, Key.new(string.upper(keys[48]), 18900, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[50]), 19500, 3))
    table.insert(key_obj, Key.new(string.upper(keys[51]), 19600, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[53]), 20000, 3))
    table.insert(key_obj, Key.new(string.upper(keys[54]), 20100, 3))

    table.insert(key_obj, Key.new(string.upper(keys[55]), 20500, 3))
    table.insert(key_obj, Key.new(string.upper(keys[56]), 20600, 3))
    table.insert(key_obj, Key.new(string.upper(keys[57]), 20700, 3))
    table.insert(key_obj, Key.new(string.upper(keys[58]), 20800, 3))

    table.insert(key_obj, Key.new(string.upper(keys[59]), 21000, 3))
    table.insert(key_obj, Key.new(string.upper(keys[60]), 21100, 3))
    table.insert(key_obj, Key.new(string.upper(keys[61]), 21200, 3))
    table.insert(key_obj, Key.new(string.upper(keys[62]), 21300, 3))
    table.insert(key_obj, Key.new(string.upper(keys[63]), 21400, 3))
    table.insert(key_obj, Key.new(string.upper(keys[64]), 21500, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[66]), 21700, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[68]), 22000, 3))
    

end
    
-- Draws the tiled map created in the main
function draw_level_1()
    -- Draws the map
    mlevel_1:draw(x,-20,2)
    -- Draws supporting images and messages
    love.graphics.draw(spells, -10, 0, 0, 3, 2.5)
    love.graphics.setColor(1, 1 , 1, alpha_img)
    love.graphics.draw(fingers, (love.graphics.getWidth() - fingers:getWidth() * 0.4) / 2, (love.graphics.getHeight() - fingers:getHeight() * 0.4 - 200) / 2, 0 , .35)
    love.graphics.setColor(1, 1, 1, 1)
    if aux_mess == 2 then
        love.graphics.print(message, love.graphics.getWidth() - 1200 / 2, (love.graphics.getHeight() - 300) / 2)
    end
    -- Draws the player
    player:draw()
    -- Draws the objects in the tables
    for _, life_obj in ipairs(lives) do
        life_obj:draw()
    end
    for _, enemy in ipairs(enemies) do
        enemy:draw()
    end
    for _, key in ipairs(key_obj) do
        key:draw()
    end

    -- The level displays the game over screen if the game status is fals
    if gamestatus == false then
        draw_go()
    end

    if completed then
        Win1.draw_win(precision)
    end
end

-- Function that defines if the corresponding key is already pressed
function keypressed(key)
    if key == keys[1] then
        key_pressed = key
        key_pressed_time = love.timer.getTime()
        return true
    elseif key and key ~= keys[1] then
        presses = presses + 1
        misses = misses + 1    
    end
end


function update_level_1(dt)
    precision = ((presses - misses) / presses) * 100

    -- Fade image
    alpha_img = alpha_img -0.002

    if gamestatus == true then

        -- Music
        if current_screen == "level_1" then
            sounds.music:play()
            sounds.music:setLooping(true)
            sounds.music:setVolume(0.25)
        end

        -- The screen constantly moves to the right changing the x variable
        if x >= -1195 then
            x = x - .15
        else 
            player.x = player.x + 1
            if player.x > love.graphics.getWidth() then
                completed = true
                if win_sound == false then
                    sounds.win:setVolume(0.25)
                    sounds.win:play()
                end
                win_sound = true
                sounds.music:stop()
                Win1.update_win(dt, "level_2", reset_level_1)
            end
        end
        
        -- Player updates
        player:update(dt)

        -- Enemy updates
        for _, enemy in ipairs(enemies) do
            enemy:update(dt)
            if player:checkCollision(enemy) then
                sounds.collision:play()
                misses = misses + 1
                table.remove(enemies, 1)
                table.remove(lives, #lives)
                table.remove(key_obj, 1)
                table.remove(keys, 1)
                if lives[1] == nil then
                    sounds.music:stop()
                    sounds.go:play()
                    sounds.go:setVolume(0.1)
                    gamestatus = false
                    break
                end
                break
            end
        end

        -- Key updates
        for _, key in ipairs(key_obj) do
            key:update(dt)
        end

        -- User presses the key and eliminates the objects
        local press = keypressed(key_pressed)
        if next(keys) ~= nil then
            if press then
                if enemies[1].x < love.graphics.getWidth() then
                    press = false
                    player.action = true
                    enemies[1].alive = false
                    key_obj[1].delete = true
                    sounds.spell:stop()
                    sounds.spell:play()
                    if keys[1] ~= "space" then
                        sounds.enemy:play()
                    else 
                        sounds.shadow:play()
                    end
                    timer_fade = timer_fade + .075
                    if timer_fade >= 1 then
                        presses = presses + 1
                        key_released = true
                        key_pressed = nil  -- Reset key_pressed when the key is released
                        table.remove(enemies, 1)
                        local key_temp = keys[1]
                        table.remove(keys, 1)
                        timer_fade = 0
                        table.remove(key_obj, 1)
                        aux_mess = aux_mess + 1
                    end
                end
            end
        end
    else
        -- Gameover update
        update_go(dt, "level_1", reset_level_1)
    end
end

-- Function that helps handeling if the key is held down    
function keyreleased(key)
    if key == keys[1] then
        key_released = true
    end
end
    

-- Function that resets the level when loosing
function reset_level_1()
    misses = 0 
    load_level_1()
end

-- Returns functions to the main
return {
    load_level_1 = load_level_1,
    draw_level_1 = draw_level_1,
    keypressed = keypressed,
    keyreleased = keyreleased, 
    update_level_1 = update_level_1,
    reset_level_1 = reset_level_1
}