function widget:GetInfo()
    return {
      name      = "APM Counter",
      desc      = "Live apm",
      author    = "Bootlegged Floris Code",
      date      = "Dec 30, 2022",
      license   = "GNU GPL, v2 or later",
      layer     = 0,
      enabled   = true  --  loaded by default?
    }
  end

  local updateTimer = 0
function widget:Update()
    if not Spring.GetSpectatingState() then
        updateTimer = updateTimer + Spring.GetLastUpdateSeconds()
        if updateTimer > 1 then
            local _, mc, kp, _, _ = Spring.GetPlayerStatistics(Spring.GetMyPlayerID())
            Spring.Echo("kp: " .. kp)
            Spring.Echo("mc: " .. mc)
            if mc and kp then
                local apm = math.ceil((mc + kp * 60) / (math.max(Spring.GetGameSeconds(), 60)) - 0.5)
                if apm and Spring.GetGameSeconds() > 0 then
                    Spring.Echo("Your APM: " .. apm)
                end
                updateTimer = 0
            end
        end
    end
end
