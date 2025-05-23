hs.hotkey.bind({"cmd", "alt", "ctrl"}, "i", function()
    hs.eventtap.keyStrokes(os.date("%a %b %d %Y %H:%M"))
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "j", function()
    hs.eventtap.keyStrokes(os.date("%Y_%m_%d"))
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "k", function()
    hs.eventtap.keyStrokes(os.date("github.com/northvolt/"))
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "l", function()
    hs.eventtap.keyStrokes(os.date("github.com/northvolt/go-service-"))
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "m", function()
    local random = math.random
    local function uuid()
        local template = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
        return string.gsub(template, '[xy]', function(c)
            local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
            return string.format('%x', v)
        end)
    end
    hs.eventtap.keyStrokes(uuid())
end)
