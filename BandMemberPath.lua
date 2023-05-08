local PathfindingService = game:GetService("PathfindingService")
local path = PathfindingService:CreatePath()
local ChosenScript = game:GetService("Selection"):Get()[1]
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
    if #ChosenScript:GetAttributes() ~= 0 then
        for Key,Att in pairs(ChosenScript:GetAttributes()) do
            ChosenScript:SetAttribute(Key,nil)
        end
    end
    local pointNum = 0
    local RandomPartList = workspace.Map.NPC.POINTS:GetChildren()
    local threePoints = {}
    for i = 1,3,1 do
        local randomPart = RandomPartList[math.random(1,#RandomPartList)]
        threePoints["Point"..tostring(i)] = randomPart.Position
        randomPart:Destroy()
    end
    --point1,point2,point3,point1
    --
    local route1 = returnPath(threePoints["Point1"],threePoints["Point2"])
    if route1 ~= nil then
        print("VALID")
        for _,Pos in pairs(route1) do
            pointNum = pointNum + 1
            ChosenScript:SetAttribute("P"..pointNum,Pos.Position)
        end
    end
    local route2 = returnPath(threePoints["Point2"],threePoints["Point3"])
    if route2 ~= nil then
        print("VALID")
        for _,Pos in pairs(route2) do
            pointNum = pointNum + 1
            ChosenScript:SetAttribute("P"..pointNum,Pos.Position)
        end
    end
    local route3 = returnPath(threePoints["Point3"],threePoints["Point1"])
    if route3 ~= nil then
        print("VALID")
        for _,Pos in pairs(route3) do
            pointNum = pointNum + 1
            ChosenScript:SetAttribute("P"..pointNum,Pos.Position)
        end
    end
end
makePosNodes()