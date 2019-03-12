local index = require("res.index")

local res = {}

function res.get(resource,arg)
	if not index[resource] then return nil end
	resource = index[resource]
	if resource["type"]=="font" then
		arg = arg or 16
		return love.graphics.newFont(resource["location"],arg)
	elseif resource["type"]=="image" then
		return love.graphics.newImage(resource["location"])
	end
end

return res
