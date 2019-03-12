local function log(s,prefix)
	if not CONFIG.debug then return end
	prefix = prefix and prefix or ""
	if CONFIG.prefix_blacklist and CONFIG.prefix_blacklist[prefix] then return end
	if CONFIG.blacklist and CONFIG.blacklist[prefix..debug.getinfo(2).name] then return end
	print(prefix..debug.getinfo(2).name..":: "..tostring(s))
end

return log
