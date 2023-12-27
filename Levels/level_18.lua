-- Level 18 screen

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
local Enemy_2 = require "Classes/Enemy_2"
local Enemy_3 = require "Classes/Enemy_3"
local Enemy_4 = require "Classes/Enemy_4"
local Enemy_5 = require "Classes/Enemy_5"
local Enemy_6 = require "Classes/Enemy_6"
local Enemy_7 = require "Classes/Enemy_7"
local Enemy_8 = require "Classes/Enemy_8"
local Enemy_9 = require "Classes/Enemy_9"
local Enemy_10 = require "Classes/Enemy_10"
local Enemy_11 = require "Classes/Enemy_11"
local Enemy_12 = require "Classes/Enemy_12"
local Enemy_13 = require "Classes/Enemy_13"
local Enemy_14 = require "Classes/Enemy_14"
-- Table to store enemies in level 18
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
local Win18 = require "Screens/Win"
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
function load_level_18()
    x = 0
    player = require "Classes/Player".new()
    lives = {}
    table.insert(lives, life.new(30, 80))
    table.insert(lives, life.new(70, 80))
    table.insert(lives, life.new(110, 80))
    enemies = {}
    keys = {"t", "h", "e", "space", "q", "u", "i", "c", "k", "space", "b", "r", "o", "w", "n", "space", "f", "o", "x", "space", "j", "u", "m", "p", "s", "space", "o", "v", "e", "r", "space", "t", "h", "e", "space", "l", "a", "z", "y", "space", "d", "o", "g", ".", "space", "p", "a", "c", "k", "space", "m", "y", "space", "b", "o", "x", "space", "w", "i", "t", "h", "space", "f", "i", "v", "e", "space", "d", "o", "z", "e", "n", "space", "l", "i", "q", "u", "o", "r", "space", "j", "u", "g", "s", ".", "space", "m", "r", "space", "j", "o", "c", "k", ",", "space", "t", "v", ",", "space", "q", "u", "i", "z", ",", "space", "p", "h", "d", ",", "space", "b", "a", "g", "s", "space", "f", "e", "w", "."}
     --      1    2    3      4      5    6    7    8    9      10     11   12   13   14   15     16     17   18   19     20     21   22   23   24   25     26     27   28   29   30     31     32   33   34     35     36   37   38   39     40     41   42   43   44     45     46   47   48   49     50     51   52     53     54   55   56     57     58   59   60   61     62     63   64   65   66     67     68   69   70   71   72     73     74   75   76   77   78   79    80      81   82   83   84   85     86     87   88     89     90   91   92   93   94     95     96   97   98     99    100   101 102  103  104    105    106  107  108  109    110    111  112  113  114    115    116  117  118  119    
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
    -- Create Enemy instances and add them to the 'enemies' table

    table.insert(enemies, Enemy_10.new(1500, false, 2))
    table.insert(enemies, Enemy_5.new(1700, false, 2))
    table.insert(enemies, Enemy_7.new(1900, false, 2))
    table.insert(enemies, Enemy_7.new(2100, true, 2))

    table.insert(enemies, Enemy_9.new(2300, false, 2))
    table.insert(enemies, Enemy_6.new(2500, false, 2))
    table.insert(enemies, Enemy_7.new(2700, false, 2))
    table.insert(enemies, Enemy_12.new(2900, false, 2))
    table.insert(enemies, Enemy_2.new(3100, false, 2))
    table.insert(enemies, Enemy_2.new(3300, true, 2))

    table.insert(enemies, Enemy_11.new(3500, false, 2))
    table.insert(enemies, Enemy_6.new(3700, false, 2))
    table.insert(enemies, Enemy_8.new(3900, false, 2))
    table.insert(enemies, Enemy_8.new(4100, false, 2))
    table.insert(enemies, Enemy_12.new(4300, false, 2))
    table.insert(enemies, Enemy_12.new(4500, true, 2))

    table.insert(enemies, Enemy_1.new(4700, false, 2))
    table.insert(enemies, Enemy_8.new(4900, false, 2))
    table.insert(enemies, Enemy_13.new(5100, false, 2))
    table.insert(enemies, Enemy_13.new(5300, true, 2))

    table.insert(enemies, Enemy_1.new(5500, false, 2))
    table.insert(enemies, Enemy_6.new(5700, false, 2))
    table.insert(enemies, Enemy_13.new(5900, false, 2))
    table.insert(enemies, Enemy_9.new(6100, false, 2))
    table.insert(enemies, Enemy_3.new(6300, false, 2))
    table.insert(enemies, Enemy_3.new(6500, true, 2))

    table.insert(enemies, Enemy_8.new(6700, false, 2))
    table.insert(enemies, Enemy_11.new(6900, false, 2))
    table.insert(enemies, Enemy_7.new(7100, false, 2))
    table.insert(enemies, Enemy_6.new(7300, false, 2))
    table.insert(enemies, Enemy_6.new(7500, true, 2))

    table.insert(enemies, Enemy_10.new(7700, false, 2))
    table.insert(enemies, Enemy_5.new(7900, false, 2))
    table.insert(enemies, Enemy_7.new(8100, false, 2))
    table.insert(enemies, Enemy_7.new(8300, true, 2))

    table.insert(enemies, Enemy_3.new(8500, false, 2))
    table.insert(enemies, Enemy_4.new(8700, false, 2))
    table.insert(enemies, Enemy_14.new(8900, false, 2))
    table.insert(enemies, Enemy_10.new(9100, false, 2))
    table.insert(enemies, Enemy_10.new(9300, true, 2))

    table.insert(enemies, Enemy_2.new(9500, false, 2))
    table.insert(enemies, Enemy_8.new(9700, false, 2))
    table.insert(enemies, Enemy_5.new(9900, false, 2))
    table.insert(enemies, Enemy_4.new(10100, false, 2))
    table.insert(enemies, Enemy_4.new(10300, true, 2))
    
    table.insert(enemies, Enemy_9.new(10500, false, 2))
    table.insert(enemies, Enemy_4.new(10700, false, 2))
    table.insert(enemies, Enemy_12.new(10900, false, 2))
    table.insert(enemies, Enemy_2.new(11100, false, 2))
    table.insert(enemies, Enemy_2.new(11300, true, 2))

    table.insert(enemies, Enemy_13.new(11500, false, 2))
    table.insert(enemies, Enemy_10.new(11700, false, 2))
    table.insert(enemies, Enemy_10.new(11900, true, 2))

    table.insert(enemies, Enemy_11.new(12100, false, 2))
    table.insert(enemies, Enemy_8.new(12300, false, 2))
    table.insert(enemies, Enemy_13.new(12500, false, 2))
    table.insert(enemies, Enemy_13.new(12700, true, 2))
    
    table.insert(enemies, Enemy_8.new(12900, false, 2))
    table.insert(enemies, Enemy_7.new(13100, false, 2))
    table.insert(enemies, Enemy_10.new(13300, false, 2))
    table.insert(enemies, Enemy_5.new(13500, false, 2))
    table.insert(enemies, Enemy_5.new(13700, true, 2))

    table.insert(enemies, Enemy_1.new(13900, false, 2))
    table.insert(enemies, Enemy_7.new(14100, false, 2))
    table.insert(enemies, Enemy_11.new(14300, false, 2))
    table.insert(enemies, Enemy_7.new(14500, false, 2))
    table.insert(enemies, Enemy_7.new(14700, true, 2))

    table.insert(enemies, Enemy_2.new(14900, false, 2))
    table.insert(enemies, Enemy_8.new(15100, false, 2))
    table.insert(enemies, Enemy_14.new(15300, false, 2))
    table.insert(enemies, Enemy_7.new(15500, false, 2))
    table.insert(enemies, Enemy_12.new(15700, false, 2))
    table.insert(enemies, Enemy_12.new(15900, true, 2))

    table.insert(enemies, Enemy_3.new(16100, false, 2))
    table.insert(enemies, Enemy_7.new(16300, false, 2))
    table.insert(enemies, Enemy_9.new(16500, false, 2))
    table.insert(enemies, Enemy_6.new(16700, false, 2))
    table.insert(enemies, Enemy_8.new(16900, false, 2))
    table.insert(enemies, Enemy_6.new(17100, false, 2))
    table.insert(enemies, Enemy_6.new(17300, true, 2))

    table.insert(enemies, Enemy_1.new(17500, false, 2))
    table.insert(enemies, Enemy_6.new(17700, false, 2))
    table.insert(enemies, Enemy_5.new(17900, false, 2))
    table.insert(enemies, Enemy_3.new(18100, false, 2))
    table.insert(enemies, Enemy_4.new(18300, false, 2))
    table.insert(enemies, Enemy_4.new(18500, true, 2))

    table.insert(enemies, Enemy_13.new(18700, false, 2))
    table.insert(enemies, Enemy_6.new(18900, false, 2))
    table.insert(enemies, Enemy_6.new(19100, true, 2))

    table.insert(enemies, Enemy_1.new(19300, false, 2))
    table.insert(enemies, Enemy_8.new(19500, false, 2))
    table.insert(enemies, Enemy_12.new(19700, false, 2))
    table.insert(enemies, Enemy_2.new(19900, false, 2)) 
    table.insert(enemies, Enemy_14.new(20100, false, 2))
    table.insert(enemies, Enemy_14.new(20300, true, 2))

    table.insert(enemies, Enemy_10.new(20500, false, 2))
    table.insert(enemies, Enemy_11.new(20700, false, 2))
    table.insert(enemies, Enemy_14.new(20900, false, 2))
    table.insert(enemies, Enemy_14.new(21100, true, 2))

    table.insert(enemies, Enemy_9.new(21300, false, 2))
    table.insert(enemies, Enemy_6.new(21500, false, 2))
    table.insert(enemies, Enemy_7.new(21700, false, 2))
    table.insert(enemies, Enemy_14.new(21900, false, 2))
    table.insert(enemies, Enemy_14.new(22100, false, 2))
    table.insert(enemies, Enemy_14.new(22300, true, 2))

    table.insert(enemies, Enemy_9.new(22500, false, 2))
    table.insert(enemies, Enemy_5.new(22700, false, 2))
    table.insert(enemies, Enemy_2.new(22900, false, 2))
    table.insert(enemies, Enemy_14.new(23100, false, 2))
    table.insert(enemies, Enemy_14.new(23300, true, 2))

    table.insert(enemies, Enemy_11.new(23500, false, 2))
    table.insert(enemies, Enemy_4.new(23700, false, 2))
    table.insert(enemies, Enemy_5.new(23900, false, 2))
    table.insert(enemies, Enemy_3.new(24100, false, 2))
    table.insert(enemies, Enemy_3.new(24300, true, 2))

    table.insert(enemies, Enemy_10.new(24500, false, 2))
    table.insert(enemies, Enemy_7.new(24700, false, 2))
    table.insert(enemies, Enemy_8.new(24900, false, 2))
    table.insert(enemies, Enemy_4.new(25100, true, 2))

    -- Create Key objects and add them to 'key_obj' table

    table.insert(key_obj, Key.new("t", 1500, 2))
    table.insert(key_obj, Key.new("h", 1700, 2))
    table.insert(key_obj, Key.new("e", 1900, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("q", 2300, 2))
    table.insert(key_obj, Key.new("u", 2500, 2))
    table.insert(key_obj, Key.new("i", 2700, 2))
    table.insert(key_obj, Key.new("c", 2900, 2))
    table.insert(key_obj, Key.new("k", 3100, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("b", 3500, 2))
    table.insert(key_obj, Key.new("r", 3700, 2))
    table.insert(key_obj, Key.new("o", 3900, 2))
    table.insert(key_obj, Key.new("w", 4100, 2))
    table.insert(key_obj, Key.new("n", 4300, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("f", 4700, 2))
    table.insert(key_obj, Key.new("o", 4900, 2))
    table.insert(key_obj, Key.new("x", 5100, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("j", 5500, 2))
    table.insert(key_obj, Key.new("u", 5700, 2))
    table.insert(key_obj, Key.new("m", 5900, 2))
    table.insert(key_obj, Key.new("p", 6100, 2))
    table.insert(key_obj, Key.new("s", 6300, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("o", 6700, 2))
    table.insert(key_obj, Key.new("v", 6900, 2))
    table.insert(key_obj, Key.new("e", 7100, 2))
    table.insert(key_obj, Key.new("r", 7300, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("t", 7700, 2))
    table.insert(key_obj, Key.new("h", 7900, 2))
    table.insert(key_obj, Key.new("e", 8100, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("l", 8500, 2))
    table.insert(key_obj, Key.new("a", 8700, 2))
    table.insert(key_obj, Key.new("z", 8900, 2))
    table.insert(key_obj, Key.new("y", 9100, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("d", 9500, 2))
    table.insert(key_obj, Key.new("o", 9700, 2))
    table.insert(key_obj, Key.new("g", 9900, 2))
    table.insert(key_obj, Key.new(".", 10100, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("p", 10500, 2))
    table.insert(key_obj, Key.new("a", 10700, 2))
    table.insert(key_obj, Key.new("c", 10900, 2))
    table.insert(key_obj, Key.new("k", 11100, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))
    
    table.insert(key_obj, Key.new("m", 11500, 2))
    table.insert(key_obj, Key.new("y", 11700, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("b", 12100, 2))
    table.insert(key_obj, Key.new("o", 12300, 2))
    table.insert(key_obj, Key.new("x", 12500, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("w", 12900, 2))
    table.insert(key_obj, Key.new("i", 13100, 2))
    table.insert(key_obj, Key.new("t", 13300, 2))
    table.insert(key_obj, Key.new("h", 13500, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("f", 13900, 2))
    table.insert(key_obj, Key.new("i", 14100, 2))
    table.insert(key_obj, Key.new("v", 14300, 2))
    table.insert(key_obj, Key.new("e", 14500, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("d", 14900, 2))
    table.insert(key_obj, Key.new("o", 15100, 2))
    table.insert(key_obj, Key.new("z", 15300, 2))
    table.insert(key_obj, Key.new("e", 15500, 2))
    table.insert(key_obj, Key.new("n", 15700, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("l", 16100, 2))
    table.insert(key_obj, Key.new("i", 16300, 2))
    table.insert(key_obj, Key.new("q", 16500, 2))
    table.insert(key_obj, Key.new("u", 16700, 2))
    table.insert(key_obj, Key.new("o", 16900, 2))
    table.insert(key_obj, Key.new("r", 17100, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("j", 17500, 2))
    table.insert(key_obj, Key.new("u", 17700, 2))
    table.insert(key_obj, Key.new("g", 17900, 2))
    table.insert(key_obj, Key.new("s", 18100, 2))
    table.insert(key_obj, Key.new(".", 18300, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("m", 18700, 2))
    table.insert(key_obj, Key.new("r", 18900, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("j", 19300, 2))
    table.insert(key_obj, Key.new("o", 19500, 2))
    table.insert(key_obj, Key.new("c", 19700, 2))
    table.insert(key_obj, Key.new("k", 19900, 2))
    table.insert(key_obj, Key.new(",", 20100, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("t", 20500, 2))
    table.insert(key_obj, Key.new("v", 20700, 2))
    table.insert(key_obj, Key.new(",", 20900, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("q", 21300, 2))
    table.insert(key_obj, Key.new("u", 21500, 2))
    table.insert(key_obj, Key.new("i", 21700, 2))
    table.insert(key_obj, Key.new("z", 21900, 2))
    table.insert(key_obj, Key.new(",", 22100, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("p", 22500, 2))
    table.insert(key_obj, Key.new("h", 22700, 2))
    table.insert(key_obj, Key.new("d", 22900, 2))
    table.insert(key_obj, Key.new(",", 23100, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("b", 23500, 2))
    table.insert(key_obj, Key.new("a", 23700, 2))
    table.insert(key_obj, Key.new("g", 23900, 2))
    table.insert(key_obj, Key.new("s", 24100, 2))
    table.insert(key_obj, Key.new("space", 0, 0, true))

    table.insert(key_obj, Key.new("f", 24500, 2))
    table.insert(key_obj, Key.new("e", 24700, 2))
    table.insert(key_obj, Key.new("w", 24900, 2))
    table.insert(key_obj, Key.new(".", 25100, 2))
    
end

-- Draws the tiled map created in the main
function draw_level_18()
    -- Draws the map
    mlevel_18:draw(x,-20,2)
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
        if key ~= nil then
            key:draw()
        end
    end

    -- The level displays the game over screen if the game status is fals
    if gamestatus == false then
        draw_go()
    end

    if completed then
        Win18.draw_win(precision)
    end
end

-- Function that defines if the corresponding key is already pressed
function keypressed_18(key)
    if key == keys[1] then
        key_pressed = key
        key_pressed_time = love.timer.getTime()
        return true
    elseif key and key ~= keys[1] then
        presses = presses + 1
        misses = misses + 1    
    end
end


function update_level_18(dt)
    precision = ((presses - misses) / presses) * 100

    -- Fade image
    alpha_img = alpha_img -0.002

    if gamestatus == true then

        -- Music
        if current_screen == "level_18" then
            sounds.music:play()
            sounds.music:setLooping(true)
            sounds.music:setVolume(0.25)
        end

        -- The screen constantly moves to the right changing the x variable
        if x >= -1195 then
            x = x - .1
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
                Win18.update_win(dt, "levels", reset_level_18)
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
            end
        end

        -- Key updates
        for _, key in ipairs(key_obj) do
            key:update(dt)
        end

        -- User presses the key and eliminates the objects
        local press = keypressed_18(key_pressed)
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
                        table.remove(key_obj, 1)
                    end
                end
            end
        end
    else
        -- Gameover update
        update_go(dt, "level_18", reset_level_18)    
    end
end

-- Function that helps handeling if the key is held down    
function keyreleased_18(key)
    if key == keys[1] then
        key_released = true
    end
end


-- Function that resets the level when loosing
function reset_level_18()
    misses = 0 
    load_level_18()
end

-- Returns functions to the main
return {
    load_level_18 = load_level_18,
    draw_level_18 = draw_level_18,
    keypressed_18 = keypressed_18,
    keyreleased_18 = keyreleased_18, 
    update_level_18 = update_level_18,
    reset_level_18 = reset_level_18
}