local PathfindingService = game:GetService("PathfindingService")
local path = PathfindingService:CreatePath()

local threePoints = {
    ["Point1"] = Vector3.new(),
    ["Point2"] = Vector3.new(),
    ["Point3"] = Vector3.new()
}

local function returnPath(startPos,EndPos)
    path:ComputeAsync(startPos, EndPos)
    if path.Status == Enum.PathStatus.Success then
        return path:GetWaypoints()
    elseif path.Status == Enum.PathStatus.ClosestNoPath then
        return path:GetWaypoints()
    else
        print("NoPath")
        return nil
    end
end

local function makePosNodes()
    local pointNum = 0
    local cycleHolder = Instance.new("ObjectValue")
    cycleHolder.Name = "CycleHolder"
    cycleHolder.Parent = game.ReplicatedStorage.CharacterFILES.NPCs.Cycles
    local NumNodes = Instance.new("IntValue")
    NumNodes.Name = "NumNodes"
    NumNodes.Parent = cycleHolder
    
    local AveragePos = Vector3.new(0,0,0)
    

    --point1,point2,point3,point1
    local invalid = false
    local route1 = returnPath(threePoints["Point1"],threePoints["Point2"])
    if route1 ~= nil then
        for _,Pos in pairs(route1) do
            pointNum = pointNum + 1
            AveragePos = AveragePos + Pos.Position
            cycleHolder:SetAttribute(pointNum,Pos.Position)
        end
    else
        invalid = true
    end
    
    local route2 = returnPath(threePoints["Point2"],threePoints["Point3"])
    if route2 ~= nil then
        for _,Pos in pairs(route2) do
            pointNum = pointNum + 1
            AveragePos = AveragePos + Pos.Position
            cycleHolder:SetAttribute(pointNum,Pos.Position)
        end
    else
       invalid = true
    end
    
    local route3 = returnPath(threePoints["Point3"],threePoints["Point1"])
    if route3 ~= nil then
        for _,Pos in pairs(route3) do
            pointNum = pointNum + 1
            AveragePos = AveragePos + Pos.Position
            cycleHolder:SetAttribute(pointNum,Pos.Position)
        end
    else
        invalid = true
    end
    
    NumNodes.Value = pointNum
    
    local ShowAverage = Instance.new("Vector3Value",cycleHolder)
    ShowAverage.Name = "AveragePos"
    ShowAverage.Value = AveragePos / pointNum
    
    if invalid == true then 
        cycleHolder:Destroy() 
        warn("Invalid Path")
    else
        warn("Path Successfully Created")
    end
end
makePosNodes()