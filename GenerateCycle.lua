local Homes = {Vector3.new(-15.948, 6, -6.562),Vector3.new(40.05, 6, -88.031),Vector3.new(164.75,  6, 320.769),
    Vector3.new(-546.35, 6, 133.369)}
local Workplaces = {Vector3.new(-430.138,6, -79.299),Vector3.new(2.954,6, -285.7),
    Vector3.new(98.837, 6, 427.53),Vector3.new(-439.086, 6, 145.227),Vector3.new(293.686, 6, -325.912),
    Vector3.new(-375.308, 6, -44.44),Vector3.new(-229.564, 6, -22.15),Vector3.new(-441.724, 6, 292.674),
    Vector3.new(-336.545, 6, -69.205),Vector3.new(75.378, 6, 488.692),Vector3.new(-74.322, 6, 547.092)}
local Activities = {Vector3.new(-123.092, 6, 47.022),Vector3.new(-48.375,6, 365.481),
    Vector3.new(-375.908, 6, -45.04),Vector3.new(-15.022,6, 168.959),Vector3.new(40.059, 6, 264.202),
    Vector3.new(-503.145,6, 374.659),Vector3.new(-159.616,6, 424.76),Vector3.new(344.516, -22.759, -138.587),
    Vector3.new(163.978, 6, 385.792),Vector3.new(361.478, 6, 53.392),Vector3.new(443.378, 6, 15.892),
    Vector3.new(371.078, 15.982, -235.408),Vector3.new(293.078, 6, -100.008)}

local ChosenCycle = game:GetService("Selection"):Get()[1]
local PFS = game:GetService("PathfindingService")
local function returnPath(Path,Pos1,Pos2)
    Path:ComputeAsync(Pos1,Pos2)
    if Path.Status == (Enum.PathStatus.Success or Enum.PathStatus.ClosestNoPath) then
        local waypoints = Path:GetWaypoints()
        return waypoints, #waypoints
    else
        return false, false
    end
end
local Path = PFS:CreatePath()
local Path = PFS:CreatePath()
local function GenerateCycle()
    for Key,Value in pairs(ChosenCycle:GetAttributes()) do
        ChosenCycle:SetAttribute(Key,nil)
    end
    local points = {}
    for _,Point in pairs(Homes) do points[#points+1] = Point end
    for _,Point in pairs(Workplaces) do points[#points+1] = Point end
    for _,Point in pairs(Activities) do points[#points+1] = Point end
    
    local p1
    local p2
    local p3
    
    p1 = points[math.random(1,#points)]
    while true do
        p2 = points[math.random(1,#points)]
        if p2 ~= p1 then break end
    end
    while true do
        p3 = points[math.random(1,#points)]
        if p3 ~= p2 then if p3 ~= p1 then break end end
    end
    
    local PathSuccessful = true
    local Path1,N1 = returnPath(Path,p1,p2)
    if Path1 == false then PathSuccessful = false end
    local Path2,N2 = returnPath(Path,p2,p3)
    if Path2 == false then PathSuccessful = false end
    local Path3,N3 = returnPath(Path,p3,p1)
    if Path3 == false then PathSuccessful = false end
    
    if PathSuccessful == false then
        GenerateCycle()
    else
        for count = 1,N1,1 do
            ChosenCycle:SetAttribute(
                tostring(#ChosenCycle:GetAttributes() + 1),
                Path1[count].Position
            )
        end
        for count = 1,N2,1 do
            ChosenCycle:SetAttribute(
                tostring(#ChosenCycle:GetAttributes() + 1),
                Path2[count].Position
            )
        end
        for count = 1,N3,1 do
            ChosenCycle:SetAttribute(
                tostring(#ChosenCycle:GetAttributes() + 1),
                Path3[count].Position
            )
        end
        print("SUCCESS.")
    end
end

GenerateCycle()