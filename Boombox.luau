local RE = Instance.new("RemoteEvent")
local Item = game:GetService("InsertService"):LoadAsset(11644532503) 
RE:FireServer(Item)

RE.OnServerEvent:Connect(function(LocalPlayer,Asset)
local Backpack = LocalPlayer.Backpack
Asset:Clone().Parent = Backpack
end)
