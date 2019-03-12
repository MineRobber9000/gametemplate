local sprite = {}
local sprites = {}

function sprite.nextID()
	return #sprites
end

function sprite.define(ss,n,w,h)
	sw, sh = ss:getDimensions()
	for i=1,n do
		x = i-1
		table.insert(sprites,{ss,love.graphics.newQuad(x*w,0,w,h,sw,sh),w,h})
		log("newQuad:: "..tostring(x*w).." 0 "..tostring(w).." "..tostring(h).." "..tostring(sw).." "..tostring(sh),"sprite.")
	end
end

function sprite.draw(i,x,y,fx,fy,r,sf)
	fx = fx and fx or false
	fy = fy and fy or false
	i = i + 1
	r = r and r or 0
	sf = sf and sf or 1
	local spr = sprites[i]
	local q = {0,0,0,0}
	if spr then
		local q = {spr[2]:getViewport()}
	end
--	log(tostring(i).." "..tostring(q[1]).." "..tostring(q[2]).." "..tostring(q[3]).." "..tostring(q[4]).." "..tostring(x).." "..tostring(y).." "..tostring(r).." "..tostring(sf),"sprite.")
	love.graphics.draw(spr[1],spr[2],x,y,r,(fx and -1 or 1)*sf,(fy and -1 or 1)*sf)
end

_G.sprite = sprite
