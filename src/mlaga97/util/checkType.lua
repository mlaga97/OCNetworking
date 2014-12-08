return function( variable, preferred_type, name )
  if type( preferred_type ) ~= "string" then
    error( "Preferred type must be of type: string" )
  end
  
  name = name or "Variable"
  if type( name ) ~= "string" then
    error( "Name must be of type: string" )
  end
  
  if type( variable ) ~= preferred_type then
    error( name .. " must be of type: " .. preferred_type )
  end
end