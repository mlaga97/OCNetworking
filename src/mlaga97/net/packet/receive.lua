local modname, path = ...
local event = require("event")
local checkType = require("mlaga97.util.checkType")
local modError = require("mlaga97.util.modError")

local function filter(port, address, requested_port, requested_address)
  if port == requested_port and address == requested_address then
    return true
  end
end

return function(requested_port, requested_address)
  -- Error check types
  checkType(requested_port or -1, "number", "Requested port")
  checkType(requested_address or "", "string", "Requested address")
  
  while true do
    -- Wait for modem_message event
    local packet = {event.pull("modem_message")}
    
    -- Is the packet one we are looking for?
    if filter(packet[4], packet[3], requested_port, requested_address) then
      -- Excellent, lets return the message.
      
      -- Do to a weird 'feature' of the language, it is entirely necessary to
      -- create an entire new table to dump the wanted variables into just
      -- so that we can immediately unpack them before returning.
      local toReturn = {}
      
      -- Find the variables we are looking for and put them in a table.
      for pos = 6,#packet do
        table.insert(toReturn,packet[pos])
      end
      
      -- Return all of the variables!!!
      return table.unpack(toReturn)
    end
    
    -- Nope? Alright, let's try again.
  end
end