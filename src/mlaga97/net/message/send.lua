local modname, path = ...
local packet = require("mlaga97.net.packet")
local modError = require("mlaga97.util.modError")
local newID = require("mlaga97.net.message.newID")

local max_length = 3

return function( address, port, socket, message )
  local id = newID()

  -- Skip unneeded waste of power if we can.  
  if #message < max_length then
    packet.send( address, port, socket, id, 1, 1, message )
    return true
  end
  
  -- Find length
  local length = 0
  for x=1,#message,max_length do length = length + 1 end
  
  -- Produce output
  local count = 1
  for x=1,#message,max_length do
    packet.send( address, port, socket, id, count, length, message:sub( x, x+max_length-1 ) )
    count = count + 1
  end
  
  return true
end