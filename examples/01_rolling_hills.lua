-- Part "prefab" to use:
local part = script.Part

local terrainModel = Instance.new("Model")
terrainModel.Name = "ProceduralGeneration"
terrainModel.Parent = workspace

function RollingHills()

	local frequency = 10
	local amplitude = 5

	for x = -100,100 do
		for z = -100,100 do
			-- Calculate 'y' by adding 'sine' and 'cosine':
			local y = (math.sin(x / frequency) + math.cos(z / frequency)) * amplitude
			-- Place part in world:
			local p = part:Clone()
			p.CFrame = CFrame.new(x, y, z)
			p.Parent = terrainModel
		end
	end

end

RollingHills()