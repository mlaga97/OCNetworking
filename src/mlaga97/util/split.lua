return function( data, block, func )
  local block = block or 16
  local count = 1
  for x=1,#data,block do
    func( data:sub( x, x+block-1 ) )
    count = count + 1
  end 
  print( "{ " .. count .. ", }" )
end