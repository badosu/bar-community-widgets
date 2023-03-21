-- This widget simulates behavior from OTA where scrolling down with mouse
-- brings to megamap (overview camera).
-- Scrolling up restores previous camera

function widget:GetInfo()
	return {
		name = "TA Scrolldown",
		desc = "Simulates TA megamap on scroll down",
		author = "badosu",
		date = "Jan 2, 2023",
		license = "GPL2+",
		layer = 0,
		enabled = true
	}
end

function widget:MouseWheel(up)
	local alt, ctrl, meta, shift = Spring.GetModKeyState()

	if alt or ctrl or meta or shift then return end

	local camState = Spring.GetCameraState()
	local isOverview = camState.name == "ov"

	if up then
		if isOverview then Spring.SendCommands({ "toggleoverview", "hideinterface" }) end

		return
	end

	if not isOverview then Spring.SendCommands({ "toggleoverview", "hideinterface" }) end
end
