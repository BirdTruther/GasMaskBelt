Events.OnInitWorld.Add(function()
    local function Adjust(Name, Property, Value)
        local item = ScriptManager.instance:getItem(Name)
        if item then
            item:DoParam(Property .. " = " .. Value)
        else
            print("Error: No item found with name " .. Name)
        end
    end

    Adjust("Base.Hat_GasMask", "AttachmentType", "GasMask")
end)