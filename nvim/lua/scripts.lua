function hello()
        res = nvim_input()
        print(res)
        print("hel")
end
vim.api.nvim_set_keymap('n',',h','<cmd>lua hello()<cr>',{})
