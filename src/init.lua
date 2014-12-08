--local session = require("mlaga97.net.session")
local message = require("mlaga97.net.message")

message.send( "server", 1337, "mlaga97.net.packet.test", "" )
message.send( "server", 1337, "mlaga97.net.packet.test", "Hello, World" )

--[[

packet -> port
message -> socket

session:send( "" )
message.send( "server", 1337, "mlaga97.net.packet.test", "" )
packet.send( "server", 1337, "mlaga97.net.packet.test", 55062, 1, 1, "" )
modem.send( "server", 1337, "mlaga97.net.packet.test", 55062, 1, 1, "" )

local "modem_message", "server", "client", 1337, 0, "mlaga97.net.packet.test", 55062, 1, 1, "" = event.pull( "modem_message" )
local 55062, 1, 1, "" = packet.receive( "client", 1337, "mlaga97.net.packet.test" )
local 55062, "" = message.receive( "client", 1337, "mlaga97.net.packet.test" )
local "" = session.receive()

]]