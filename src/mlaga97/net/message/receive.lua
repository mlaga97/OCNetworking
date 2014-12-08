local modname, path = ...
local packet = require("mlaga97.net.packet")
local checkType = require("mlaga97.util.checkType")
local modError = require("mlaga97.util.modError")

local function filter(socket, requested_socket)
	if socket == requested_socket then
		return true
	end
end

return function(requested_socket, requested_port, requested_address)
  -- Error check types
  checkType(requested_socket or "", "string", "Requested socket")
  
  while true do
		-- Get packet with proper port and address
	  message = {packet.receive(requested_port, requested_address)}
	  
	  -- Is this the message the one we are looking for?
    if filter(message[1], requested_socket) then
      -- Excellent, lets return the message.
      
      -- Do to a weird 'feature' of the language, it is entirely necessary to
      -- create an entire new table to dump the wanted variables into just
      -- so that we can immediately unpack them before returning.
      local toReturn = {}
      
      -- Find the variables we are looking for and put them in a table.
      for pos = 2,#message do
        table.insert(toReturn,message[pos])
      end
      
      -- Return all of the variables!!!
      return table.unpack(toReturn)
    end
    
    -- Nope? Alright, let's try again.
end