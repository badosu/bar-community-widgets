function widget:GetInfo()
    return {
    name      = "Automatic interface hide and playertv enable",
    desc      = "yes",
    author    = "Damgam",
    date      = "2022",
    layer     = 5,
    enabled   = true  --  loaded by default?
    }
end

function widget:GameFrame(n)
    if n == 1 then
        if Spring.GetSpectatingState() then
            Spring.SendCommands("playertv")
            Spring.SendCommands("hideinterface")
            Spring.SendCommands("option allyselunits_select 0")
            Spring.SendCommands("option lockcamera_hideenemies 0")
            Spring.SendCommands("option lockcamera_los 0")
        end
    end
    
    if n%900 == 0  then
        Spring.SendCommands("clearmapmarks")
    end
end
    
