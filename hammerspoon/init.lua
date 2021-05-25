hs.hotkey.bind({"cmd", "alt", "ctrl"}, "i", function()
  hs.eventtap.keyStrokes(os.date("%c"))
end)


