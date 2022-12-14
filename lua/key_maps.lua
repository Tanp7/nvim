local M = {}
local noremap = function(mode, lhs, rhs, ...)
    local opts = {}
    if arg then
        for k, v in pairs(arg[1]) do
            opts[k]=v
        end
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end
-- local map = function(mode, lhs, rhs, ...)
--     local opts = {}
--     if arg then
--         for k, v in pairs(arg[1]) do
--             opts[k]=v
--         end
--     end
--     vim.keymap.set(mode, lhs, rhs, opts)
-- end

-- Remove spaces at the end of lines
noremap('n', '<Space>cw', '<cmd>keeppatterns %s/\\s\\+$//e<CR>', {silent=true})

-- alt-; to exit insert mode in terminal
noremap('t', '<A-;>', '<C-\\><C-n>')

-- switch window
noremap('t', '<A-h>', '<C-\\><C-N><C-w>h')
noremap('t', '<A-j>', '<C-\\><C-N><C-w>j')
noremap('t', '<A-k>', '<C-\\><C-N><C-w>k')
noremap('t', '<A-l>', '<C-\\><C-N><C-w>l')
noremap('i', '<A-h>', '<C-\\><C-N><C-w>h')
noremap('i', '<A-j>', '<C-\\><C-N><C-w>j')
noremap('i', '<A-k>', '<C-\\><C-N><C-w>k')
noremap('i', '<A-l>', '<C-\\><C-N><C-w>l')
noremap('n', '<A-h>', '<C-w>h')
noremap('n', '<A-j>', '<C-w>j')
noremap('n', '<A-k>', '<C-w>k')
noremap('n', '<A-l>', '<C-w>l')

-- nnn
noremap('n', '<Leader>n', '<cmd>NnnPicker<CR>')

--Hop
noremap('', 's', '<cmd>HopChar2<CR>')

-- barbar
noremap('n', '<Leader>bc', '<cmd>BufferCloseAllButCurrent<CR>', {silent=true})
noremap('n', '<A-w>', '<cmd>BufferClose<CR>', {silent=true})
noremap('i', '<A-w>', '<cmd>BufferClose<CR>', {silent=true})
noremap('n', '<A-q>', '<cmd>BufferClose!<CR>', {silent=true})
noremap('n', '<A-,>', '<cmd>BufferPrevious<CR>', {silent=true})
noremap('n', '<A-.>', '<cmd>BufferNext<CR>', {silent=true})
noremap('i', '<A-,>', '<cmd>BufferPrevious<CR>', {silent=true})
noremap('i', '<A-.>', '<cmd>BufferNext<CR>', {silent=true})
noremap('n', 'gb', '<cmd>BufferPick<CR>', {silent=true})

-- settings for resize splitted window
noremap('n', '<C-w>[', '<cmd>vertical resize -3<CR>')
noremap('n', '<C-w>]', '<cmd>vertical resize +3<CR>')

-- Type jj to exit insert mode
noremap('i', 'jj', '<Esc>')

-- Type S, Q to save or quit
noremap('n', 'S', ':w<CR>')
noremap('n', 'Q', ':q<CR>')

-- Ctrl-a to copy all
noremap('n',  '<C-A>', '<cmd>%y+<CR>')

-- correct spelling on the fly
noremap('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

-- telescope
local function layout_bottom()
    return [[{
        layout_strategy = 'bottom_pane',
    }]]
end
noremap('n', '<Leader>ff', require"telescope.builtin".find_files)
noremap('n', '<Leader>ft', require"my_telescope".find_acm_template)
noremap('n', '<Leader>fd', require"my_telescope".find_dot_files)
noremap('n', '<C-p>', require"telescope.builtin".find_files)
noremap('n', 'gd', require"telescope.builtin".lsp_definitions)
noremap('n', 'gi', require"telescope.builtin".lsp_implementations)
noremap('n', 'gr', require"telescope.builtin".lsp_references)
noremap('n', '<Leader>ca', require"my_telescope".lsp_code_actions)
noremap('n', '<Leader>s', require"telescope.builtin".lsp_document_symbols)
noremap('n', '<Leader>E', require"my_telescope".diagnostics)

-- termtogle
noremap({'n', 't'}, '<A-p>', '<cmd>ToggleTerm<cr>')
noremap('i', '<A-p>', '<esc><cmd>ToggleTerm<cr>')

-- compile/run/test
-- noremap('n', '<Leader>r', function() require"my_functions".compileAndRun(false) end)
noremap('n', '<Leader>r', function() require"my_functions".compileAndRun(false) end)
noremap('n', '<Leader>t', function() require"my_functions".compileAndRun(true) end)


-- Sandwich
-- add
noremap('n', '<C-s>a', '<Plug>(operator-sandwich-add)', {silent=true})
noremap('x', '<C-s>a', '<Plug>(operator-sandwich-add)', {silent=true})
noremap('o', '<C-s>a', '<Plug>(operator-sandwich-g@)', {silent=true})

-- delete
noremap('x', '<C-s>d', '<Plug>(operator-sandwich-delete)', {silent=true})
noremap('n', '<C-s>d', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)', {silent=true})
noremap('n', '<C-s>db', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)', {silent=true})

-- replace
noremap('x', '<c-s>r', '<Plug>(operator-sandwich-replace)', {silent=true})
noremap('n', '<C-s>r', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)', {silent=true})
noremap('n', '<C-s>rb', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)', {silent=true})

-- dap
noremap('n', '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
noremap('n', '<leader>ds', "<cmd>lua require'dap'.repl.open()<cr>")
noremap('n', '<C-c>', "<cmd>lua require'dap'.continue()<cr>")
noremap('n', '<C-n>', "<cmd>lua require'dap'.step_over()<cr>")
noremap('n', '<C-s>', "<cmd>lua require'dap'.step_into()<cr>")
