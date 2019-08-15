function GenerateHeightmap(size, seed)

	-- Frequency:
	local freq = 10

	-- Create 2D heightmap:
	local heightmap = {}
	for x = 1,size do
		local hx = {}
		heightmap[x] = hx
		for z = 1,size do
			-- Generate a perlin noise value:
			local y = math.noise((x + seed) / freq, (z + seed) / freq)
			hx[z] = math.clamp(y + 0.5, 0, 1)
		end
	end

	return heightmap

end

-- Generate heightmap with a size of 100x100, with a seed of 45:
local heightmap = GenerateHeightmap(100, 45)