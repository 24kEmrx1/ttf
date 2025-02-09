--!nolint
local re = Instance.new("RemoteEvent")

re:FireServer(game.Players.LocalPlayer)

local function ChangeCharacterToR6(player)
	if not player or not player.Character then return end

	local oldCharacter = player.Character
	local userId = player.UserId

	local humanoidDesc = game.Players:GetHumanoidDescriptionFromUserId(userId)
	local newCharacter = game.Players:CreateHumanoidModelFromDescription(humanoidDesc, Enum.HumanoidRigType.R6)

	if newCharacter then
		newCharacter.Parent = workspace
		newCharacter.Name = player.Name

		local rootPart = newCharacter:FindFirstChild("HumanoidRootPart") or newCharacter.PrimaryPart
		if rootPart and oldCharacter:FindFirstChild("HumanoidRootPart") then
			rootPart.CFrame = oldCharacter.HumanoidRootPart.CFrame
		end

		oldCharacter:Destroy()

		player.Character = newCharacter
	end
end

re.OnServerEvent:Connect(function(_,Plr)
	ChangeCharacterToR6(Plr)
end)
