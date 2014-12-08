local modname, path, debug = ...

return {
  ["send"] = require(modname .. ".send"),
  ["receive"] = require(modname .. ".receive"),
  ["newID"] = require(modname .. ".newID"),
}