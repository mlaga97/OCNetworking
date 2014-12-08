local modname, path = ...
local checkType = require("util.checkType")
local event = require("event")
local modError = require("util.modError")

return function(self, port, socket)
  modError(modname, "not yet implemented")
end

--[[
function session:listen( port, socket, modem )
	local new = self:new( "", port, socket, 0, "", modem )
	
	new.modem.open( new.port )
	
	while true do
		local type, recipient, sender, port, distance, message = event.pull("modem_message")
		print( "You should probably do something with this message..." )
	end
end
]]