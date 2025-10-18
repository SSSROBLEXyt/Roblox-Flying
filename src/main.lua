--[[
 WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
 This is a cleaned-up and fixed version of the UI + simple fly controls that were provided.
]]

-- main.lua
-- Loader for the UI + fly modules. This script should be run inside Roblox.
-- NOTE: This project is only supported with Delta.

local success, ui = pcall(function()
	return require(script.Parent.ui)
end)

if success and type(ui) == "table" and ui.create then
	ui.create()
else
	warn("Failed to load UI module. Ensure this is running inside Roblox and that Delta is available.")
end
