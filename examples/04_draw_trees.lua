function DrawTrees()

	local heightmap = GenerateHeightmap(100)

	-- List of tree prefabs to use:
	local trees = {script.Tree01, script.Tree02, script.Tree03, script.Tree04}

	local numTrees = #trees
	local rng = Random.new()

	for x = 1,#heightmap do
		local hx = heightmap[x]
		for z = 1,#hx do
			local y = hx[z]
			local chance = rng:NextNumber(0, 1)
			if (chance < y) then
				-- Get random tree:
				local tree = trees[rng:NextInteger(1, numTrees)]:Clone()
				-- Position tree in world:
				tree:SetPrimaryPartCFrame(CFrame.new(
					x + rng:NextNumber(-1, 1),
					0.5,
					z + rng:NextNumber(-1, 1)
				))
				tree.Parent = terrainModel
			end
		end
	end

end