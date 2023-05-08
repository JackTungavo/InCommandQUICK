local InsertService = game:GetService("InsertService")
local IDs = {}

for _,ID in pairs(IDs) do
    local success, model = pcall(InsertService.LoadAsset, InsertService, ID)
    if success and model then
       print("Model loaded successfully")
       model.Parent = workspace.GUITARS
    else
       print("Model failed to load!")
    end
end
