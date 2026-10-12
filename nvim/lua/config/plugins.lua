-- bootstrap vim-plug
local plug_path = vim.fn.stdpath("data") .. "/site/autoload/plug.vim"
if vim.fn.empty(vim.fn.glob(plug_path)) == 1 then
  vim.fn.system({
    "curl", "-fLo", plug_path, "--create-dirs",
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
  })
  vim.api.nvim_create_autocmd("VimEnter", {
    command = "PlugInstall --sync | source $MYVIMRC",
  })
end

local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/.vim/plugged")
Plug("junegunn/fzf", { ["do"] = function() vim.fn["fzf#install"]() end })
Plug("junegunn/fzf.vim")
Plug("neoclide/coc.nvim", { branch = "release" })
Plug("tpope/vim-fugitive")
Plug("tpope/vim-rhubarb")
Plug("BurntSushi/ripgrep")
Plug("TheAtlasEngine/PastelColors")
Plug("gruvbox-community/gruvbox")
Plug("cormacrelf/vim-colors-github")
Plug("fcpg/vim-fahrenheit")
Plug("tpope/vim-commentary")
Plug("tpope/vim-surround")
Plug("vim-airline/vim-airline")
Plug("szw/vim-maximizer")
Plug("airblade/vim-gitgutter")
Plug("pangloss/vim-javascript")    -- JavaScript support
Plug("leafgarland/typescript-vim") -- TypeScript syntax
Plug("maxmellon/vim-jsx-pretty")   -- JS and JSX syntax
Plug("jparise/vim-graphql")
Plug("preservim/nerdtree")
Plug("yssl/QFEnter")
Plug("zbirenbaum/copilot.lua")
Plug("nvim-lua/plenary.nvim") -- required by CopilotChat
Plug("CopilotC-Nvim/CopilotChat.nvim")
Plug("copilotlsp-nvim/copilot-lsp")
Plug("f-person/auto-dark-mode.nvim")
vim.call("plug#end")
