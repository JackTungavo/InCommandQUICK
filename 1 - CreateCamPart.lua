--CreateCamPart
local CurrentMission = 20
local CamFolder = nil
for _,Folder in pairs(workspace.Missions.CHAPTERS:GetDescendants()) do
    if Folder:IsA("Folder") then
        if Folder.Name == tostring(CurrentMission) then
            if Folder:FindFirstChild("Cameras") then
                CamFolder = Folder.Cameras
            end
        end
    end
end

local NodeIndex = 0
if CamFolder ~= nil then
    while true do
        if CamFolder:FindFirstChild("C"..tostring(NodeIndex)) then
            NodeIndex = NodeIndex + 1
        else
            local newNode = Instance.new("Part")
            newNode.Parent = CamFolder
            newNode.Anchored = true
            newNode.CanCollide = false
            newNode.Transparency = 1
            newNode.Size = Vector3.new(0.1,0.1,0.1)
            newNode.CFrame = workspace.CurrentCamera.CFrame
            newNode.Name = "C"..tostring(NodeIndex)
            print("CamFolder: "..tostring(CurrentMission)..".Cameras")
            print("Camera: C"..tostring(NodeIndex).." Created.")
            break
        end
    end
end
