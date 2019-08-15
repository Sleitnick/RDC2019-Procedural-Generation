local amplitude = 1
local frequency = 10
local lacunarity = 2
local gain = 1
local octaves = 4
local seed = 45

-- Fractal Brownian Motion:
function FBM(x, z)
	local y = 0
	local amp = amplitude
	local freq = frequency
	for i = 1,octaves do
		y = (y + (amp * math.noise((x + seed) / freq, (z + seed) / freq)))
		freq = (freq * lacunarity)
		amp = (amp * gain)
	end
	return y
end

function GenerateHeightmap(size)

	-- Create 2D heightmap:
	local heightmap = {}
	for x = 1,size do
		local hx = {}
		heightmap[x] = hx
		for z = 1,size do
			-- Generate a perlin noise value using FBM:
			local y = FBM(x, z)
			hx[z] = y
		end
	end

	return heightmap

end

-- Generate heightmap with a size of 100x100:
local heightmap = GenerateHeightmap(100)