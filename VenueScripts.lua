--ReplaceVenueScripts
local VenueNames = {}
--PlaceNamesInArray
for _,V in pairs(game.StarterGui.TriggerPerformances.VENUES:GetChildren()) do
    if V.Name ~= "PracticePerformance" then
        VenueNames[#VenueNames + 1] = V.Name
    end
end

--NewFolder
local NewScripts = Instance.new("Folder")
NewScripts.Name = "NewScripts"
NewScripts.Parent = game.StarterGui.TriggerPerformances.VENUES

local TemplateScript = NewScripts.Parent.Warehouse
for _,V in pairs(VenueNames) do
    local newscript = TemplateScript:Clone()
    newscript.Parent = NewScripts
    newscript.Name = V
    newscript.Disabled = true
end

if NewScripts.Parent:FindFirstChild("PracticePerformance") then
    NewScripts.Parent:FindFirstChild("PracticePerformance").Parent = NewScripts
end

NewScripts.Parent = NewScripts.Parent.Parent
game.StarterGui.TriggerPerformances.VENUES:ClearAllChildren()

for _,V in pairs(NewScripts:GetChildren()) do
    V.Parent = game.StarterGui.TriggerPerformances.VENUES
end
NewScripts:Destroy()