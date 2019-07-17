_G.CONFIG = require("conf").properties
require("cindy").applyPatch()
_G.log = require("log")
_G.palette = require("palette")
_G.pal = palette.getPalette(CONFIG.palette)
_G.code = require("code")

function _G.seconds(s)
	return s*CONFIG.framerate
end

function _G.prepForImage()
	love.graphics.setColor(255,255,255)
end

function _G.drawCentered(d,x,y,s,xc,yc)
	s = s and s or 1
	yc = yc~=nil and yc or false
	xc = xc~=nil and xc or true
	log(tostring(xc).." "..tostring(yc))
	width, height = d:getDimensions()
	width = width * s
	height = height * s
	if xc then
		x = (CONFIG.window.width/2)-(width/2)
	end
	if yc then
		y = (CONFIG.window.height/2)-(height/2)
	end
	love.graphics.draw(d,x,y,0,s,s)
end

function love.load()
--	font = res.get("font",32)
	code.init()
end

function love.keypressed(key,sc,isRepeat)
	if isRepeat then return end
	if key=="f1" then love.graphics.captureScreenshot(onScreenshot) end
end

function onScreenshot(im)
	if not love.filesystem.getInfo("screenshots","directory") then
		love.filesystem.createDirectory("screenshots")
	end
	screenshots = love.filesystem.getDirectoryItems("screenshots")
	scrnums = {}
	for i=1,#screenshots do
		scrnums[tonumber(screenshots[i]:match("%d+"))]=true
	end
	i = 0
	while scrnums[i] do i = i + 1 end -- find first unused screenshot number
	im:encode("png","screenshots/scr"..tostring(i)..".png")
end

local t = 0
function love.update(dt)
	if love.keyboard.isDown("escape") then love.event.quit() end
	t = t + dt
	while t>(1/CONFIG.framerate) do
		t = t - (1/CONFIG.framerate)
		code.update()
	end
end

function love.draw()
	love.graphics.setBackgroundColor(0,0,0)
	love.graphics.setColor(255,255,255)
--	love.graphics.setFont(font)
	code.draw()
end
