local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true } -- {Link: According to Stack Overflow https://stackoverflow.com/questions/77255648/best-method-to-convert-a-vim-expr-value-to-neovim-in-lua} and {Link: Medium https://medium.com/unixification/must-have-neovim-keymaps-51c283394070}, Neovim's vim.keymap.set function has "noremap = true" as its default behavior, but it's often included for clarity.
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- NvimTree
map("n", "<C-n>", "<cmd>Neotree toggle<cr>", { desc = "Toggle NvimTree" }) 




-- Normal Mode Mappings (equivalent to "noremap" or "nnoremap")
map("n", "H", "0", { desc = "Go to beginning of line" }) -- "noremap H 0"
map("n", "L", "$", { desc = "Go to end of line" }) -- "noremap L $"

map("n", "K", "<C-u>", { desc = "Scroll up half page" }) -- "nnoremap K <c-u>"
map("n", "J", "<C-d>", { desc = "Scroll down half page" }) -- "nnoremap J <c-d>"

map("n", "<C-u>", "<C-b>", { desc = "Scroll up a full page" }) -- "nnoremap <c-u> <c-b>"
map("n", "<C-d>", "<C-f>", { desc = "Scroll down a full page" }) -- "nnoremap <c-d> <c-f>"

map("n", "<C-j>", "J", { desc = "Join line below" }) -- "nnoremap <c-j> J"
map("n", "<C-s>", "s", { desc = "Substitute character" }) -- "nnoremap <c-s> s"


--Switch Buffers
map ("n", "<S-Left>", ":bprev<CR>")
map ("n", "<S-Right>", ":bnext<CR>")
map ("n", "<C-h>", ":bprev<CR>")
map ("n", "<C-l>", ":bnext<CR>")
map ("n", "<C-w>", ":bw<CR>") -- close buffer

map("n", "<C-k>", "gcc", { noremap = false })


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles)

-- diagnostics
-- vim.keymap.set ('n', '<leader>dd', builtin.diagnostics)
vim.keymap.set("n", "<leader>dd", function()
  require("telescope.builtin").diagnostics({ bufnr = 0 })
end, { noremap = true, silent = true, desc = "Telescope: Buffer diagnostics" })

vim.keymap.set ('n', '<leader>dt', builtin.lsp_type_definitions)
vim.keymap.set ('n', '<leader>dr', builtin.lsp_references)
vim.keymap.set ('n', '<leader>dl', builtin.lsp_definitions)
vim.keymap.set ('n', '<leader>di', builtin.lsp_implementations)
vim.keymap.set ('n', '<leader>ds', builtin.lsp_document_symbols)

--Copilot
vim.keymap.set("n", "<leader>cc", ":CopilotChatToggle<CR>", { noremap = true, silent = true, desc = "Toggle Copilot Chat" })
vim.keymap.set("x", "<leader>cc", ":'<,'>CopilotChat<cr>", { desc = "copilot chat selection" })

--Toggle Term
map("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Terminal (small)" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle Vertical Terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Horizontal Terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal" })
map('t', '<C-q>', '<C-\\><C-n>:bd!<CR>', { noremap = true, silent = true })


--Commenting
map("n", "<C-k>", function() require("Comment.api").toggle.linewise.current() end, { noremap = true, silent = true })

--  Visual Mode Mappings
map("v", "<C-k>", function()
  local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'nx', false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { noremap = true, silent = true })
