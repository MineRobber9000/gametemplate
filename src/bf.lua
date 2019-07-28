local bf = {}

bf.memory = setmetatable({},{__index=function(t,k)
	if k>(256*240) then -- out of bounds
		error("Out of bounds read",2)
		return -- just to be safe, in case someone tries to overwrite error
	end
	t[k]=0
	return 0
end})
bf.pointer = 1

-- Program
bf.program = ""
bf.pc = 1

function bf.runInstruction()
	if bf.pc>string.len(bf.program) then return end
	char = string.sub(bf.program,bf.pc,bf.pc)
--	print(char)
	bf.commands[char](bf)
	if bf.memory[bf.pointer]>255 then bf.memory[bf.pointer]=bf.memory[bf.pointer]-256 end
	if bf.memory[bf.pointer]<0 then bf.memory[bf.pointer]=bf.memory[bf.pointer]+256 end
	if bf.pointer>(256*240) then bf.pointer=bf.pointer-(256*240) end
	if bf.pointer<0 then bf.pointer=bf.pointer+(256*240) end
end

function bf.incPc()
	bf.pc=bf.pc+1
end

function bf.resetState()
	bf.pc = 1
	bf.pointer = 1
	bf.memory = setmetatable({},{__index=function(t,k) if k>(256*240) then error("Out of bounds read",2) return end t[k]=0 return 0 end})
end

bf.commands = setmetatable({},{__index=function(t,k) t[k] = function() end return function() end end})

bf.commands["+"] = function(bf)
	bf.memory[bf.pointer]=bf.memory[bf.pointer]+1
	bf.incPc()
end

bf.commands["-"] = function(bf)
	bf.memory[bf.pointer]=bf.memory[bf.pointer]-1
end

bf.commands[">"] = function(bf)
	bf.pointer=bf.pointer+1
end

bf.commands["<"] = function(bf)
	bf.pointer=bf.pointer-1
end

bf.commands["["] = function(bf)
	if bf.memory[bf.pointer]>0 then bf.incPc() return end -- if the cell isn't zero, just advance into the loop
	i=bf.pc+1
	d=1
	while i<=bf.program:len() and d>0 do
		if bf.program:sub(i,i)=="[" then d=d+1 end
		if bf.program:sub(i,i)=="]" then d=d-1 end
		i=i+1
	end
	bf.pc=i
end

bf.commands["]"] = function(bf)
	if bf.memory[bf.pointer]==0 then bf.incPc() return end -- if the cell is zero, just advance past the loop
	i=bf.pc-1
	d=1
	while i<=bf.program:len() and d>0 do
		if bf.program:sub(i,i)=="]" then d=d+1 end
		if bf.program:sub(i,i)=="[" then d=d-1 end
		i=i-1
	end
	bf.pc=i+1
end

return bf
