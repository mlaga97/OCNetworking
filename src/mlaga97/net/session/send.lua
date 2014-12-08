local modname, path = ...
local checkType = require("util.checkType")
local component = require("component")
local modError = require("util.modError")

return function(self, data)
  modError(modname, "not yet implemented")
  
  checkType(data, "string", "data")
end
--[[
function session:send( message )
  -- pack data into packet and send the packet
end
]]  