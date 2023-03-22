function widget:GetInfo()
    return {
        name = "Procrastinator",
        desc = "Skips current task to move on to the next",
        author = "lolsteamroller",
        date = "April 4, 2022",
        license = "GNU GPL, v2 or later",
        layer = 1, --  after the normal widgets
        enabled = true --  loaded by default?
    }
end

function widget:Initialize()
    widgetHandler:AddAction("procrastinate", ExecuteCommand)
end

local GetSelectedUnits = Spring.GetSelectedUnits
local GetUnitCurrentCommand = Spring.GetUnitCurrentCommand
local GiveOrderToUnit = Spring.GiveOrderToUnit

function ExecuteCommand()
    local selUnits = GetSelectedUnits()
    for i = 1, #selUnits do
        local id = selUnits[i]
        local cmdID, _, cmdTag = Spring.GetUnitCurrentCommand(id)
        if cmdID then
            GiveOrderToUnit(id, CMD.REMOVE, {cmdTag}, 0)
        end
    end
end
