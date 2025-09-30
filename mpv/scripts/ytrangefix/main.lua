-- find a free TCP port by asking the OS
local function find_free_port()
	local sock = assert(require("socket").bind("127.0.0.1", 0))
	local _, port = sock:getsockname()
	sock:close()
	return port
end

local function init()
	local url = mp.get_property("stream-open-filename")
	-- only act on YouTube links
	if url:find("^https:") == nil or url:find("youtu") == nil then
		return
	end

	local proxy = mp.get_property("http-proxy")
	if proxy and proxy ~= "" and not proxy:find("127.0.0.1") then
		return
	end

	-- pick a free port
	local port = find_free_port()

	-- launch mitm proxy
	local args = {
		mp.get_script_directory() .. "/http-ytproxy",
		"-c",
		mp.get_script_directory() .. "/cert.pem",
		"-k",
		mp.get_script_directory() .. "/key.pem",
		"-r",
		"10485760", -- range modification
		"-p",
		tostring(port), -- proxy port (dynamic!)
	}
	mp.command_native_async({
		name = "subprocess",
		capture_stdout = false,
		playback_only = false,
		args = args,
	})

	-- tell mpv to use our dynamic proxy
	mp.set_property("http-proxy", "http://127.0.0.1:" .. port)
	mp.set_property("tls-verify", "no")
end

mp.register_event("start-file", init)
