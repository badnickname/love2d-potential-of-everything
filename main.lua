-- !important: some assects couldn't be published because of license's rules. lines with imports these assets marked as TODO

-- cd ..
-- cat ./love.exe game.love > game1.exe
-- ./love.exe game

-- global variables
earn = nil
loaded = false
time = 1
night = 0
day_time = 2400
score = 0
music = nil

-- import assets
require 'background'
require 'clouds'
require 'stars'
require 'land'
require 'city'
require 'dragon'
require 'snows'

assets = { 
    array = { background, stars, land, city, snows, dragon, clouds },
    load = function(self)
        for i = 1, 7 do
            self.array[i]:load()
        end
    end,
    update = function(self)
        for i = 1, 7 do
            self.array[i]:update()
        end
    end,
    draw = function(self)
        for i = 1, 7 do
            self.array[i]:draw()
        end
    end
}

-- main loop
function love.update(dt)
    if not loaded then
        if love.keyboard.isDown('space') then
            loaded = true
            love.audio.play(music)
            score = 0
        end
        return
    end 

    time = time + 1
    if math.fmod(time, day_time) < day_time / 2 and night > 0 then
        night = night - 0.01
    elseif math.fmod(time, day_time) > day_time / 2 and night < 1 then
        night = night + 0.01
    end

    if time > 19200 then
        loaded = false
        time = 0
        night = 0
    end
    
    assets:update()
end

function love.load()
    love.window.setTitle('Potential of everything')
    love.window.setMode(512, 512)
    assets:load()
    -- TODO music = love.audio.newSource("soundtrack.mp3", "stream")
    music:setVolume(0.8)
    -- TODO earn = love.audio.newSource("score.wav", "stream")
end

function love.draw()
    if not loaded then
        love.graphics.print("PRESS SPACE", 226, 256)
        if score > 0 then 
            love.graphics.print("YOUR SCORE: " .. score, 219, 226)
            love.graphics.print("made with love to Viky <3", 192, 286)
        end
        return
    end
    assets:draw()

    love.graphics.setColor(night * 0.6, 0.7 * night, 1 - (night * 0.6), 1)
    love.graphics.print("SCORE: " .. score, 236, 256);
    love.graphics.setColor(1, 1, 1, 1)
end