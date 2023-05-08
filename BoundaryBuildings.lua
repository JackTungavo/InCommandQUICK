--PlaceNewBuildings
local newFolder = Instance.new("Folder")
newFolder.Parent = workspace
newFolder.Name = "newSkyscrapers"

for i,v in pairs(workspace.Map.CityDECOR.BOUNDARYBUILDINGS:GetChildren()) do
    local randomFrame = workspace.SkyscraperDEV:GetChildren()[math.random(1,#workspace.SkyscraperDEV:GetChildren())]
    local placeNewFrame = randomFrame:Clone()
    placeNewFrame.Parent = workspace.newSkyscrapers
    placeNewFrame:SetPrimaryPartCFrame(v.CFrame)
    placeNewFrame.MeshPart.Position = v.Position
    placeNewFrame.MeshPart.Size = v.Size
    placeNewFrame.MeshPart.Size = Vector3.new(
        placeNewFrame.MeshPart.Size.X + placeNewFrame.XDifference.Value,
        v.Size.Y,
        placeNewFrame.MeshPart.Size.Z + placeNewFrame.ZDifference.Value
    )
    placeNewFrame.MeshPart.Position = v.Position
    
    local NewModel = Instance.new("Model")
    NewModel.Parent = workspace.newSkyscrapers
    v.Parent = NewModel
    placeNewFrame.MeshPart.Parent = NewModel
    placeNewFrame:Destroy()
end


for i,v in pairs(workspace.newSkyscrapers:GetChildren()) do
    v.Parent = workspace.Map.CityDECOR.BOUNDARYBUILDINGS
end

newFolder:Destroy()
print("DONE.")