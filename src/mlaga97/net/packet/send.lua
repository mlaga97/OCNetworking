local modname, path = ...
local modError = require("mlaga97.util.modError")

return function( address, port, ... )
  if _G.debug then
    print("Sent Message to " .. address .. ":" .. port .. "\n\t", ...)
    return true
  end
  
  modem.send( address, port, ... )
end