local modname, path = ...
local component = require("component")
local modError = require("util.modError")

return function(self, modem, ...)
  if #{...} > 0 then
    modError(modname, "parameter not implemented")
  end
  
  local new = {
    ["address"] = address or "",
    ["port"] = port or 0,
    ["response_port"] = response_port or 0,
    ["socket"] = socket or "",
    ["response_socket"] = response_socket or "",
    ["modem"] = modem or component.modem,
  }
  
  setmetatable(new, {__index = self})
  return new
end