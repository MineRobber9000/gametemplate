local palette = {}
local palettes = {}

local function setColorPal(p)
	return function(i)
		c = p[i+1]
		love.graphics.setColor(c[1],c[2],c[3])
	end
end

local function setBGColorPal(p)
	return function(i)
		c = p[i+1]
		love.graphics.setBackgroundColor(c[1],c[2],c[3])
	end
end

function palette.register(name,colors)
	local pal = {}
	pal.name = name
	pal.colors = colors
	pal.setColor = setColorPal(colors)
	pal.setBackgroundColor = setBGColorPal(colors)
	palettes[name]=pal
	return pal
end

function palette.getPalette(name) return palettes[name] end

palette.register("DB16",{{20,12,28},{68,36,52},{48,52,109},{78,74,78},{133,76,48},{52,101,36},{208,70,72},{117,113,97},{89,125,206},{210,125,44},{133,149,161},{109,170,44},{210,170,153},{109,194,202},{218,212,94},{222,238,214}})

return palette
