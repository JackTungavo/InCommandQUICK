local Added = 0
for _,Part in pairs(game:GetDescendants()) do
    if Part:IsA("Humanoid") then
        if Part:FindFirstChildWhichIsA("Animator") then
            print("AnimatorFound")
        else
            local NewAnimator = Instance.new("Animator")
            NewAnimator.Parent = Part
            Added = Added + 1
        end
    end
end

print("ANIMATORS ADDED: "..tostring(Added))