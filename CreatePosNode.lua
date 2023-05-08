local Selection = game:GetService("Selection")
for _,Object in pairs(Selection:Get()) do
    local Root = Object:FindFirstChild("HumanoidRootPart")
    if Root then
        local newPartParent = Root.Parent.Parent
        local newPartName = Root.Parent.Name
        local checkIndex = 0
        while true do
            local sameNameObject = newPartParent:FindFirstChild(Object.Name)
            if sameNameObject then
                if sameNameObject ~= Object then    --NotSameObject
                    checkIndex = checkIndex + 1
                end
            else
                break
            end
        
            checkIndex = checkIndex + 1
           if newPartParent:FindFirstChild(newPartName..tostring(checkIndex)) then
           else
               newPartName = newPartName..tostring(checkIndex)
               break
           end
        end 
        local newPart = Root:Clone()
        newPart.Parent = newPartParent
        newPart.Name = newPartName
        newPart.CastShadow = false
        newPart.Transparency = 1
        newPart.CanCollide = false
        newPart.CanTouch = false
        newPart.CanQuery = false
        newPart.Anchored = true
        newPart.CFrame = Root.CFrame
        newPart:ClearAllChildren()
        Root.Parent:Destroy() --DeleteOriginalModel
        --print("PosCreated")
    end
end