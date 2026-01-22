local function check_gpu()
    -- We check xrandr to see if HDMI-1-0 is the PRIMARY display
    local handle = io.popen("xrandr | grep 'HDMI-1-0 connected primary'")
    local result = handle:read("*a")
    handle:close()

    if result ~= "" then
        mp.set_property("user-data/is-tv", "yes")
    else
        mp.set_property("user-data/is-tv", "no")
    end
end

-- Check when the file starts
mp.register_event("file-loaded", check_gpu)
