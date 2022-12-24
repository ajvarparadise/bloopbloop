-- [x] rita en grå bakgrund // DONE
-- [ ] ladda in grisar svg 
-- [ ] ladda in gubbe svg
-- [ ] flytta gubbe till höger
-- [x] lyssna på io för instruktioner 
-- [x] ta emot input på något sätt? event? keyboard value
-- [ ] TODO:
local utf8 = require "utf8"

grey = {110 / 225, 110 / 225, 110 / 225, 100 / 100}

white = {225 / 225, 225 / 225, 225 / 225, 100 / 100}

function love.draw()
    userInput()
end

function love.load()
    resetScreen()
    placeholder = "type something here -->"
    text = placeholder
end

function love.keypressed(key)
    if key == "return" then
        translateInputToAction(text)
        text = ""
    end

    if key == "backspace" and string.len(text) > 0 then
        deleteCharacterFromString(text)
    end
    if key == "rctrl" then -- set to whatever key you want to use
        debug.debug()
    end
end

function love.textinput(t)
    if (t:match("%s")) then
        -- Improper characters detected.
    else
        placeholder = ""
        text = text .. t
    end
end

function resetScreen()
    setBackground()
    text = ""
end

function deleteCharacterFromString(str)
    local offset = getStringLength(text) - 1
    text = string.sub(text, 1, utf8.offset(text, offset))
end

function setBackground()
    love.graphics.setBackgroundColor(grey)
end

function userInput()
    local consoleHeight = 50
    consoleXStart = love.graphics.getHeight() - consoleHeight
    drawConsole(consoleHeight, consoleXStart)
    printUserInput(consoleXStart + (consoleHeight / 2) - 10)
end

function drawConsole(consoleHeight, consoleXStart)
    local consoleYEnd = 0
    local consoleWidth = love.graphics.getWidth()
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle('fill', 0, consoleXStart, consoleWidth, consoleHeight)

end

function printUserInput(consoleXStart)
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(text, 10, consoleXStart, love.graphics.getWidth())
end

function getStringLength(str)
    -- abstractions on top of lua 
    return string.len(text)
end

function makeItRain()
    -- easy effect for kids
end

function handleJump()
    love.graphics.setBackgroundColor(white)
end

function translateInputToAction(action)
    if action == "jump()" then
        handleJump()
    else
        resetScreen()
    end
end
