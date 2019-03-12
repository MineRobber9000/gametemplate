local code = {}

function code.init() end

function code.update() end

function code.draw()
	pal.setBackgroundColor(0)
	pal.setColor(15)
	love.graphics.print("Hello world!",1,1)
end

return code
