local CHECKBOX_NAME = "ClickToMoveSettingsCheckButton"

local function hasVisibleAutoInteractControl(panel)
	for _, control in pairs(panel.controls or {}) do
		if control.cvar and string.lower(control.cvar) == "autointeract" and control:IsShown() then
			return true
		end
	end

	local children = { panel:GetChildren() }
	for _, control in ipairs(children) do
		if control.cvar and string.lower(control.cvar) == "autointeract" and control:IsShown() then
			return true
		end
	end

	return false
end

local function ensureClickToMoveControl(panel)
	if hasVisibleAutoInteractControl(panel) or _G[CHECKBOX_NAME] then
		return
	end

	local checkbox = CreateFrame("CheckButton", CHECKBOX_NAME, panel, "InterfaceOptionsCheckButtonTemplate")
	checkbox:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, -250)
	checkbox:SetChecked(GetCVar("autointeract") == "1")
	checkbox:SetScript("OnClick", function(self)
		SetCVar("autointeract", self:GetChecked() and "1" or "0")
	end)

	local label = _G[CHECKBOX_NAME .. "Text"]
	if label then
		label:SetText(_G.CLICK_TO_MOVE or "Click to Move")
	end

	checkbox.tooltipText = _G.OPTION_TOOLTIP_CLICK_TO_MOVE
end

local installer = CreateFrame("Frame")
installer:SetScript("OnUpdate", function(self)
	local panel = _G.InterfaceOptionsMousePanel
	if not panel then
		return
	end

	self:SetScript("OnUpdate", nil)
	panel:HookScript("OnShow", ensureClickToMoveControl)
	if panel:IsShown() then
		ensureClickToMoveControl(panel)
	end
end)
