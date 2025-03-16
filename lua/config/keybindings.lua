-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap=false})
vim.api.nvim_set_keymap("n", "sr", ":%s/", { desc = 'Start search and replace sequence.'})

-- Folding
-- za zo zR zM

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- buffers
vim.api.nvim_set_keymap("n", "tk", ":blast<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tj", ":bfirst<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "th", ":bprev<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tl", ":bnext<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", {noremap=false})
-- files
vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "WW", ":w!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "E", "$", {noremap=false})
vim.api.nvim_set_keymap("n", "B", "^", {noremap=false})
vim.api.nvim_set_keymap("n", "TT", ":TransparentToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", {noremap=true})
--
-- splits
--
vim.api.nvim_set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", {noremap=true})
vim.keymap.set('n', '<space><space>', "<cmd>set nohlsearch<CR>")


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- [[ Telescope ]]
-- See `:help telescope.builtin`
-- If live_grep is not working check if Telescope is healthy by typing in  
-- :checkhealth telescope
-- You may have to install the program ripgrep as live_grep relies on it!!
vim.keymap.set('n', '<leader>fg', ':Telescope grep_string<cr>')

vim.keymap.set('n', '<leader>ffc', ':Telescope live_grep<cr>', {desc = '[f]ind [f]iles [c]ontaining'})

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '<space> Search Files' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = '[F]ind [r]ecently opened files' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[b][ ] Find existing buffers' })
vim.keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = '[f]ind [k]eymaps' })
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').colorscheme, { desc = '[f]ind [c]olorschemes' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- NERDTree
-- You can use a split view if you use
-- s you open the files side by side
-- i you open the files one above the other
-- Toggle NERDTree in Normal Mode
vim.api.nvim_set_keymap('n', '<leader>tt', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
-- Toggle NERDTree in Insert Mode
vim.api.nvim_set_keymap('i', '<C-t>', '<Esc>:NvimTreeToggle<CR>', {noremap = true, silent = true})
-- Find the current buffer in NERDTree
vim.api.nvim_set_keymap('n', '<leader>tf', ':NvimTreeFindFileToggle<CR>', {noremap = true, silent = true})

-- buffers
vim.keymap.set('n', '<leader><leader>l', ':tabnext<CR>', {desc = 'n next tab'})
vim.keymap.set('n', '<leader><leader>h', ':tabprevious<CR>', {desc = 'n previous tab'})



-- Move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
-- Move lines in visual mode with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Flash extension for find operations with labels
-- vim.keymap.set('n', 's', require('flash').jump(), { desc = 'Flash search extension'} )

