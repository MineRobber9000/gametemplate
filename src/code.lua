local code = {}

local bf = require "bf"

bf.program = "+[+]"

function code.init()
	love.graphics.setFont(love.graphics.newFont(24))
end

function code.update()
	bf.runInstruction()
end

function code.draw()
	pal.setBackgroundColor(0)
	pal.setColor(bf.memory[1]%16)
	love.graphics.print("Hello world!",1,1)
end

return code
