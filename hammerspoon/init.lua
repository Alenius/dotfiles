hs.hotkey.bind({"cmd", "alt", "ctrl"}, "i", function()
  hs.eventtap.keyStrokes(os.date("%c"))
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "j", function()
  hs.eventtap.keyStrokes(os.date("%Y_%m_%d"))
end)

