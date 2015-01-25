-- Hex converter, for RGB colors
function hex(inp)
	return inp > 16 and string.format("%X", inp) or string.format("0%X", inp)
end

-- Battery monitor
battery_widget = widget({ type = "textbox", name = "battery_widget", align = "right" })
function battery_status ()
	local output={} -- output buffer
	local fd=io.popen("acpitool -b", "r") -- list present batteries
	local line=fd:read()
	while line do -- there might be several batteries
		local battery_num = string.match(line, "Battery \#(%d+)")
		local battery_load = string.match(line, " (%d*)\.%d+%%")
		local time_rem = string.match(line, "(%d+\:%d+)\:%d+")
		if battery_num and battery_load and time_rem then
			table.insert(output, "<span color=\"#"
			.. hex(170 * (100 - tonumber(battery_load)) / 100)
			.. hex(170 * tonumber(battery_load) / 100)
			.. "00\">" .. time_rem .. " " .. battery_load .. "%</span>")
		elseif battery_num and battery_load then -- remaining time unavailable
			table.insert(output, "<span color=\"#00AA00\">" .. battery_load.."%</span>")
		end
		line=fd:read() -- read next line
	end
	return table.concat(output," ")
end
battery_widget.text = " " .. battery_status() .. " "

battery_widget_timer=timer({timeout=17})
battery_widget_timer:add_signal("timeout", function()
	battery_widget.text = " " .. battery_status() .. " "
end)
battery_widget_timer:start()
