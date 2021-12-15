local function multi_bezier(t, pos)
	local x,y,z = 0,0,0
	
	for i = #pos - 1, 0, -1 do
		local index = #pos - i
		
		local brackets = (1-t)^i
		local bracket_mult = ((i == 0 or i == #pos - 1) and 1 or #pos-1) * (t ^ (index - 1))
		
		x = x + bracket_mult * brackets * pos[index].X
		y = y + bracket_mult * brackets * pos[index].Y
		z = z + bracket_mult * brackets * pos[index].Z -- remove z if only 2d
	end
	
	return x,y,z
end