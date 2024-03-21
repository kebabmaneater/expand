local HttpService = game:GetService("HttpService")
local URL_TO_API_DUMP = "https://raw.githubusercontent.com/MaximumADHD/Roblox-Client-Tracker/roblox/API-Dump.json"

local apiDump
function getResult()
	local success, result = pcall(HttpService.GetAsync, HttpService, URL_TO_API_DUMP)
	if not success then
		warn("HTTP requests are disabled.")
		return
	end

	result = HttpService:JSONDecode(result)
	apiDump = result
	return result
end

local APIDump = {
	APIDump = if apiDump then apiDump else getResult()
}

return APIDump