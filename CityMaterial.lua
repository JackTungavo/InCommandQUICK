for _,Part in pairs(workspace:GetDescendants())do
    if Part:IsA("BasePart") then
    Part.Transparency = 1
        if Part.Material == Enum.Material.Foil then
            workspace.Terrain:FillBlock(Part.CFrame,Part.Size,Enum.Material.Water)
        elseif Part.Material == Enum.Material.Metal then
            workspace.Terrain:FillBlock(Part.CFrame,Part.Size,Enum.Material.Rock)
        elseif Part.Material == Enum.Material.Grass then
            workspace.Terrain:FillBlock(Part.CFrame,Part.Size,Enum.Material.Grass)
        elseif Part.Material == Enum.Material.Granite then
            workspace.Terrain:FillBlock(Part.CFrame,Part.Size,Enum.Material.Slate)
        elseif Part.Material == Enum.Material.Concrete then
            if Part.Name == "Road" then
                workspace.Terrain:FillBlock(Part.CFrame,Part.Size,Enum.Material.Concrete)
            else
                workspace.Terrain:FillBlock(Part.CFrame,Part.Size,Enum.Material.Pavement)
            end
        end
    end
end