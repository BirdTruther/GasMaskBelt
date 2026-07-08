require "Hotbar/ISHotbar"

local original_equipItem = ISHotbar.equipItem

local SUPPORTED_MASKS = {
    ["Base.Hat_GasMask"]           = true,
    ["Base.Hat_BuildersRespirator"] = true,
}

local function isItemWorn(character, targetItem)
    local wornItems = character:getWornItems()
    for i = 0, wornItems:size() - 1 do
        local wornItem = wornItems:getItemByIndex(i)
        if wornItem == targetItem then
            return true
        end
    end
    return false
end

local function getItemBodyLocation(item)
    if item and item.getBodyLocation then
        return item:getBodyLocation()
    end
    return nil
end

function ISHotbar:equipItem(item)
    if item and SUPPORTED_MASKS[item:getFullType()] then
        ISInventoryPaneContextMenu.transferIfNeeded(self.chr, item)

        local bodyLocation = getItemBodyLocation(item)
        if not bodyLocation then
            print("GasMask hotbar: failed to resolve body location from getBodyLocation()")
            return
        end

        if isItemWorn(self.chr, item) then
            ISTimedActionQueue.add(ISUnequipAction:new(self.chr, item, 20))
        else
            self.chr:setWornItem(bodyLocation, item)
            triggerEvent("OnClothingUpdated", self.chr)
        end

        self.chr:getInventory():setDrawDirty(true)
        getPlayerData(self.chr:getPlayerNum()).playerInventory:refreshBackpacks()
        return
    end

    return original_equipItem(self, item)
end
