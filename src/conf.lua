local conf = {}
function love.conf(t)
	t.window.title = "bfc"
	t.window.width = 256
	t.window.height = 240
	t.identity = "BrainfuckFC"
	t.framerate = 60
	t.debug=true
	t.prefix_blacklist={}
	t.blacklist = {["drawCentered"]=true}
	t.palette = "DB16"
	conf.properties = t
end
return conf
