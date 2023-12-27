-- Level 16 screen

-- x variable for map displaying
local x
-- Player variable
local player
-- Adding Life class
local life = require "Classes/Life"
-- Table to store lives
local lives
-- Adding enemy class
local Enemy_14 = require "Classes/Enemy_14"
-- Table to store enemies in level 16
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
local Win16 = require "Screens/Win"
local completed
local win_sound
-- Image of fingers positioning
local spells
local fingers
local alpha_img
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
function load_level_16()
    x = 0
    player = require "Classes/Player".new()
    lives = {}
    table.insert(lives, life.new(30, 80))
    table.insert(lives, life.new(70, 80))
    table.insert(lives, life.new(110, 80))
    enemies = {}
    keys = {"z", ",", "space", ",", "z", "space", "space", ",", "z", "z", "z", "z", "space", ",", ",", ",", "space", "z", "space", "z", "space", ",", "space", ",", "space", ",", ",", "z", "space", "z", "z", ",", "space", "z", "space", ",", "z", "space", ",", ",", "space", "space", "z", ",", "z", "z", ",", "z", "space", ",", ",", "space", "z", "z", ",", "z", ",", ",", ",", "z", "z", ",", ",", ",", "space", "z", "space", ",", "z", "x", "c", "v", "b", "n", "m", ",", "space", "space", ",", "z", "x", "m", "v", "b", "c", "n", "n", "c", "v", "b", "z", ",", "x", "m", "space", "z", ",", ",", "z"}
    --       1    2      3      4    5      6        7      8    9    10   11   12     13     14   15   16     17     18     19     20     21     22     23     24     25     26   27   28     29     30   31   32     33     34     35     36   37     38     39   40     41       42     43   44   45   46   47   48     49     50   51     52     53   54   55   56   57   58   59   60   61   62   63   64     65     66     67     68   69   70   71   72   73   74   75   76     77       78     79   80   81   82   83   84   85   86   87   88   89   90   91   92   93   94     95     96   97   98   99        
    key_obj = {}
    alpha_img = 1
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
    -- Create Enemy_14 instances and add them to the 'enemies' table
    table.insert(enemies, Enemy_14.new(1500, false, 2))
    table.insert(enemies, Enemy_14.new(1700, false, 2))
    table.insert(enemies, Enemy_14.new(1900, true, 2))

    table.insert(enemies, Enemy_14.new(2300, false, 2))
    table.insert(enemies, Enemy_14.new(2500, false, 2))
    table.insert(enemies, Enemy_14.new(2700, true, 2))

    table.insert(enemies, Enemy_14.new(3100, true, 2))
    table.insert(enemies, Enemy_14.new(3300, false, 2))
    table.insert(enemies, Enemy_14.new(3500, false, 2))

    table.insert(enemies, Enemy_14.new(3900, false, 2))
    table.insert(enemies, Enemy_14.new(4100, false, 2))
    table.insert(enemies, Enemy_14.new(4300, false, 2))
    table.insert(enemies, Enemy_14.new(4500, true, 2))

    table.insert(enemies, Enemy_14.new(4900, false, 2))
    table.insert(enemies, Enemy_14.new(5000, false, 2))
    table.insert(enemies, Enemy_14.new(5100, false, 2))
    table.insert(enemies, Enemy_14.new(5200, true, 2))

    table.insert(enemies, Enemy_14.new(5500, false, 2))
    table.insert(enemies, Enemy_14.new(5600, true, 2))
    table.insert(enemies, Enemy_14.new(5700, false, 2))
    table.insert(enemies, Enemy_14.new(5800, true, 2))

    table.insert(enemies, Enemy_14.new(6100, false, 2))
    table.insert(enemies, Enemy_14.new(6200, true, 2))
    table.insert(enemies, Enemy_14.new(6300, false, 2))
    table.insert(enemies, Enemy_14.new(6400, true, 2))

    table.insert(enemies, Enemy_14.new(10500, false, 3))
    table.insert(enemies, Enemy_14.new(10600, false, 3))
    table.insert(enemies, Enemy_14.new(10700, false, 3))
    table.insert(enemies, Enemy_14.new(10800, true, 3))
    table.insert(enemies, Enemy_14.new(10900, false, 3))
    table.insert(enemies, Enemy_14.new(11000, false, 3))
    table.insert(enemies, Enemy_14.new(11100, false, 3))
    table.insert(enemies, Enemy_14.new(11200, true, 3))

    table.insert(enemies, Enemy_14.new(11600, false, 3))
    table.insert(enemies, Enemy_14.new(11700, true, 3))
    table.insert(enemies, Enemy_14.new(11800, false, 3))
    table.insert(enemies, Enemy_14.new(11900, false, 3))
    table.insert(enemies, Enemy_14.new(12000, true, 3))
    table.insert(enemies, Enemy_14.new(12100, false, 3))
    table.insert(enemies, Enemy_14.new(12200, false, 3))

    table.insert(enemies, Enemy_14.new(12600, true, 3))
    table.insert(enemies, Enemy_14.new(12700, true, 3))
    table.insert(enemies, Enemy_14.new(12800, false, 3))
    table.insert(enemies, Enemy_14.new(12900, false, 3))
    table.insert(enemies, Enemy_14.new(13000, false, 3))
    table.insert(enemies, Enemy_14.new(13100, false, 3))
    table.insert(enemies, Enemy_14.new(13200, false, 3))
    table.insert(enemies, Enemy_14.new(13300, false, 3))
    table.insert(enemies, Enemy_14.new(13400, true, 3))

    table.insert(enemies, Enemy_14.new(13900, false, 3))
    table.insert(enemies, Enemy_14.new(14000, false, 3))
    table.insert(enemies, Enemy_14.new(14200, true, 3))
    table.insert(enemies, Enemy_14.new(14400, false, 3))
    table.insert(enemies, Enemy_14.new(14500, false, 3))

    table.insert(enemies, Enemy_14.new(14900, false, 3))
    table.insert(enemies, Enemy_14.new(15000, false, 3))
    table.insert(enemies, Enemy_14.new(15100, false, 3))
    table.insert(enemies, Enemy_14.new(15200, false, 3))

    table.insert(enemies, Enemy_14.new(15400, false, 3))
    table.insert(enemies, Enemy_14.new(15500, false, 3))
    table.insert(enemies, Enemy_14.new(15600, false, 3))
    table.insert(enemies, Enemy_14.new(15700, false, 3))
    table.insert(enemies, Enemy_14.new(15800, false, 3))
    table.insert(enemies, Enemy_14.new(15900, false, 3))
    table.insert(enemies, Enemy_14.new(16000, true, 3))
    table.insert(enemies, Enemy_14.new(16100, false, 3))
    table.insert(enemies, Enemy_14.new(16300, true, 3))
    table.insert(enemies, Enemy_14.new(16400, false, 3))

    table.insert(enemies, Enemy_14.new(17000, false, 3))
    table.insert(enemies, Enemy_14.new(17200, false, 3))
    table.insert(enemies, Enemy_14.new(17400, false, 3))
    table.insert(enemies, Enemy_14.new(17600, false, 3))

    table.insert(enemies, Enemy_14.new(18000, false, 3))
    table.insert(enemies, Enemy_14.new(18200, false, 3))
    table.insert(enemies, Enemy_14.new(18400, false, 3))
    table.insert(enemies, Enemy_14.new(18600, false, 3))
    table.insert(enemies, Enemy_14.new(18800, true, 3))
    table.insert(enemies, Enemy_14.new(19000, true, 3))
    table.insert(enemies, Enemy_14.new(19200, false, 3))
    table.insert(enemies, Enemy_14.new(19400, false, 3))
    table.insert(enemies, Enemy_14.new(19600, false, 3))
    table.insert(enemies, Enemy_14.new(19800, false, 3))

    table.insert(enemies, Enemy_14.new(20200, false, 3))
    table.insert(enemies, Enemy_14.new(20400, false, 3))
    table.insert(enemies, Enemy_14.new(20600, false, 3))
    table.insert(enemies, Enemy_14.new(20800, false, 3))

    table.insert(enemies, Enemy_14.new(21200, false, 3))
    table.insert(enemies, Enemy_14.new(21400, false, 3))
    table.insert(enemies, Enemy_14.new(21600, false, 3))
    table.insert(enemies, Enemy_14.new(21800, false, 3))

    table.insert(enemies, Enemy_14.new(22200, false, 3))
    table.insert(enemies, Enemy_14.new(22400, false, 3))
    table.insert(enemies, Enemy_14.new(22600, false, 3))
    table.insert(enemies, Enemy_14.new(22800, false, 3))
    table.insert(enemies, Enemy_14.new(23000, true, 3))
    table.insert(enemies, Enemy_14.new(23200, false, 3))
    table.insert(enemies, Enemy_14.new(23400, false, 3))
    table.insert(enemies, Enemy_14.new(23600, false, 3))
    table.insert(enemies, Enemy_14.new(23800, false, 3))

    -- Create Key objects and add them to 'key_obj' table

    table.insert(key_obj, Key.new(string.upper(keys[1]), 1500, 2))
    table.insert(key_obj, Key.new(string.upper(keys[2]), 1700, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[4]), 2300, 2))
    table.insert(key_obj, Key.new(string.upper(keys[5]), 2500, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[8]), 3300, 2))
    table.insert(key_obj, Key.new(string.upper(keys[9]), 3500, 2))

    table.insert(key_obj, Key.new(string.upper(keys[10]), 3900, 2))
    table.insert(key_obj, Key.new(string.upper(keys[11]), 4100, 2))
    table.insert(key_obj, Key.new(string.upper(keys[12]), 4300, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[14]), 4900, 2))
    table.insert(key_obj, Key.new(string.upper(keys[15]), 5000, 2))
    table.insert(key_obj, Key.new(string.upper(keys[16]), 5100, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[18]), 5500, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[20]), 5700, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[22]), 6100, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[24]), 6300, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[26]), 10500, 3))
    table.insert(key_obj, Key.new(string.upper(keys[27]), 10600, 3))
    table.insert(key_obj, Key.new(string.upper(keys[28]), 10700, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[30]), 10900, 3))
    table.insert(key_obj, Key.new(string.upper(keys[31]), 11000, 3))
    table.insert(key_obj, Key.new(string.upper(keys[32]), 11100, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[34]), 11600, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[36]), 11800, 3))
    table.insert(key_obj, Key.new(string.upper(keys[37]), 11900, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[39]), 12100, 3))
    table.insert(key_obj, Key.new(string.upper(keys[40]), 12200, 3))

    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[43]), 12800, 3))
    table.insert(key_obj, Key.new(string.upper(keys[44]), 12900, 3))
    table.insert(key_obj, Key.new(string.upper(keys[45]), 13000, 3))
    table.insert(key_obj, Key.new(string.upper(keys[46]), 13100, 3))
    table.insert(key_obj, Key.new(string.upper(keys[47]), 13200, 3))
    table.insert(key_obj, Key.new(string.upper(keys[48]), 13300, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new(string.upper(keys[50]), 13900, 3))
    table.insert(key_obj, Key.new(string.upper(keys[51]), 14000, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[53]), 14400, 3))
    table.insert(key_obj, Key.new(string.upper(keys[54]), 14500, 3))

    table.insert(key_obj, Key.new(string.upper(keys[55]), 14900, 3))
    table.insert(key_obj, Key.new(string.upper(keys[56]), 15000, 3))
    table.insert(key_obj, Key.new(string.upper(keys[57]), 15100, 3))
    table.insert(key_obj, Key.new(string.upper(keys[58]), 15200, 3))

    table.insert(key_obj, Key.new(string.upper(keys[59]), 15400, 3))
    table.insert(key_obj, Key.new(string.upper(keys[60]), 15500, 3))
    table.insert(key_obj, Key.new(string.upper(keys[61]), 15600, 3))
    table.insert(key_obj, Key.new(string.upper(keys[62]), 15700, 3))
    table.insert(key_obj, Key.new(string.upper(keys[63]), 15800, 3))
    table.insert(key_obj, Key.new(string.upper(keys[64]), 15900, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[66]), 16100, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[68]), 16400, 3))

    table.insert(key_obj, Key.new(string.upper(keys[69]), 17000, 3))
    table.insert(key_obj, Key.new(string.upper(keys[70]), 17200, 3))
    table.insert(key_obj, Key.new(string.upper(keys[71]), 17400, 3))
    table.insert(key_obj, Key.new(string.upper(keys[72]), 17600, 3))

    table.insert(key_obj, Key.new(string.upper(keys[73]), 18000, 3))
    table.insert(key_obj, Key.new(string.upper(keys[74]), 18200, 3))
    table.insert(key_obj, Key.new(string.upper(keys[75]), 18400, 3))
    table.insert(key_obj, Key.new(string.upper(keys[76]), 18600, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[79]), 19200, 3))
    table.insert(key_obj, Key.new(string.upper(keys[80]), 19400, 3))
    table.insert(key_obj, Key.new(string.upper(keys[81]), 19600, 3))
    table.insert(key_obj, Key.new(string.upper(keys[82]), 19800, 3))

    table.insert(key_obj, Key.new(string.upper(keys[83]), 20200, 3))
    table.insert(key_obj, Key.new(string.upper(keys[84]), 20400, 3))
    table.insert(key_obj, Key.new(string.upper(keys[85]), 20600, 3))
    table.insert(key_obj, Key.new(string.upper(keys[86]), 20800, 3))

    table.insert(key_obj, Key.new(string.upper(keys[87]), 21200, 3))
    table.insert(key_obj, Key.new(string.upper(keys[88]), 21400, 3))
    table.insert(key_obj, Key.new(string.upper(keys[89]), 21600, 3))
    table.insert(key_obj, Key.new(string.upper(keys[90]), 21800, 3))

    table.insert(key_obj, Key.new(string.upper(keys[91]), 22200, 3))
    table.insert(key_obj, Key.new(string.upper(keys[92]), 22400, 3))
    table.insert(key_obj, Key.new(string.upper(keys[93]), 22600, 3))
    table.insert(key_obj, Key.new(string.upper(keys[94]), 22800, 3))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    table.insert(key_obj, Key.new(string.upper(keys[96]), 23200, 3))
    table.insert(key_obj, Key.new(string.upper(keys[97]), 23400, 3))
    table.insert(key_obj, Key.new(string.upper(keys[98]), 23600, 3))
    table.insert(key_obj, Key.new(string.upper(keys[99]), 23800, 3))
     
end

-- Draws the tiled map created in the main
function draw_level_16()
    -- Draws the map
    mlevel_16:draw(x,-20,2)
    -- Draws supporting images and messages
    love.graphics.draw(spells, -10, 0, 0, 3, 2.5)
    love.graphics.setColor(1, 1 , 1, alpha_img)
    love.graphics.draw(fingers, (love.graphics.getWidth() - fingers:getWidth() * 0.4) / 2, (love.graphics.getHeight() - fingers:getHeight() * 0.4 - 200) / 2, 0 , .35)
    love.graphics.setColor(1, 1, 1, 1)
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
        Win16.draw_win(precision)
    end
end

-- Function that defines if the corresponding key is already pressed
function keypressed_16(key)
    if key == keys[1] then
        key_pressed = key
        key_pressed_time = love.timer.getTime()
        return true
    elseif key and key ~= keys[1] then
        presses = presses + 1
        misses = misses + 1    
    end
end


function update_level_16(dt)
    precision = ((presses - misses) / presses) * 100

    -- Fade image
    alpha_img = alpha_img -0.002

    if gamestatus == true then

        -- Music
        if current_screen == "level_16" then
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
                Win16.update_win(dt, "level_17", reset_level_16)
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
                end
                break
            end
        end

        -- Key updates
        for _, key in ipairs(key_obj) do
            key:update(dt)
        end

        -- User presses the key and eliminates the objects
        local press = keypressed_16(key_pressed)
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
                        table.remove(keys, 1)
                        timer_fade = 0
                        table.remove(key_obj, 1)
                    end
                end
            end
        end
    else
        -- Gameover update
        update_go(dt, "level_16", reset_level_16)
    end
end

-- Function that helps handeling if the key is held down    
function keyreleased_16(key)
    if key == keys[1] then
        key_released = true
    end
end


-- Function that resets the level when loosing
function reset_level_16()
    misses = 0 
    load_level_16()
end

-- Returns functions to the main
return {
    load_level_16 = load_level_16,
    draw_level_16 = draw_level_16,
    keypressed_16 = keypressed_16,
    keyreleased_16 = keyreleased_16, 
    update_level_16 = update_level_16,
    reset_level_16 = reset_level_16
}