-- [x] rita en grå bakgrund // DONE
-- [ ] ladda in grisar svg 
-- [ ] ladda in gubbe svg
-- [ ] flytta gubbe till höger
-- [x] lyssna på io för instruktioner 
-- [x] ta emot input på något sätt? event? keyboard value

-- [ ] TODO:


local utf8 = require "utf8"

function setBackground()
    love.graphics.setBackgroundColor(110/225,110/225,110/225,100/100)
end

function love.load()
    text = ""
end

function love.textinput(t)
-- only allow text character 
   text = text .. t
end


function love.keypressed(key)
    if key == "return" 
        then 
            action = text 
            text = ""
    end

    if key == "backspace" and string.len(text) > 0
        then 
            text = string.sub(text, 1, utf8.offset(text,getStringLength(text) ) - 1)
        end
end

function getStringLength(str)
    -- abstractions on top of lua 
    return string.len(text)
end

function makeItRain()
 -- easy effect for kids
end

function love.draw()
    setBackground()
    love.graphics.printf(text, 0, 0, love.graphics.getWidth())
    if action == "love.jump()" 
        then love.graphics.printf("juuuuump", 20, 20, love.graphics.getWidth()) 
    end
end
