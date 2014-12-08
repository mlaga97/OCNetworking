local modname, path, debug = ...

return {
  -- Constructor
  ["new"] = require(modname .. ".new"),
  
  -- Initializers
  ["connect"] = require(modname .. ".connect"),
  ["listen"] = require(modname .. ".listen"),
  
  -- Utilities
  ["send"] = require(modname .. ".send"),
  ["receive"] = require(modname .. ".receive"),
}