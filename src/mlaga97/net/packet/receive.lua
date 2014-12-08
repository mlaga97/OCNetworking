local modname, path = ...
local modError = require("mlaga97.util.modError")

return function( requested_address, requested_port )
  while true do
    local type, this_computer, address, port, distance, ... = event.pull( "modem_message" )
    if address == requested_address and port = requested_port then
      return ...
    end
  end
end