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
