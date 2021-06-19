-- Automatically restore session if .vimsession file is found


fn = vim.fn
cmd = vim.cmd

if not next(fn.argv()) then -- no file has been specified. try to restore session
	local f = io.open(".vimsession", "r")
	if f ~= nil then
		io.close(f)
		cmd('source .vimsession')
	end
end
