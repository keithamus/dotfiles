call plug#begin('~/.vim/plugged')

""" Navigation

  " EasyMotion (Vim motions on speed!) & Incsearch (Improved incremental searching for Vim)
  " Provides more useful UI for searching text across files
  " see augroup easymotionSettings for more
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'

  " FZF Fuzzy Search
  " Allows for quickly finding/searching across files
  " see augroup fzfSettings for more
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

""" Project Tools

  " Editorconfig
  " Reads .editorconfig files and cleans up files on save
  Plug 'editorconfig/editorconfig-vim'

  " Fugitive
  " Adds a bunch of helpful git commands to Vim
  Plug 'tpope/vim-fugitive'

  " Rhubarb adds GitHub support to fugitive
  Plug 'tpope/vim-rhubarb'

""" Editing tools

  " Add keymaps to S to surround selections in characters
  Plug 'tpope/vim-surround'

  " Expand utility of ^+A
  Plug 'tpope/vim-speeddating'

  " gcc to toggle comments
  Plug 'tpope/vim-commentary'

  " bunch of cool keyboard combos
  Plug 'tpope/vim-unimpaired'

  " enable . repeating for a bunch of plugins
  Plug 'tpope/vim-repeat'

  " cx{motion} store a value to exchange with the next cx
  Plug 'tommcdo/vim-exchange'

""" TextObject Plugins!

  " ai/ii - select region at this indent and further
  " aI/iI - select region at this indent alone
  Plug 'michaeljsmith/vim-indent-object'

  " aa/ia - select argument in function call
  Plug 'vim-scripts/argtextobj.vim'

""" Autocompletion

  " COC Completion Engine
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc-yank', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-tsserver', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-tslint-plugin', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-css', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-yaml', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-emmet', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-eslint', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-git', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-html', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-json', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-pairs', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-prettier', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-python', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-rls', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-solargraph', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-tslint-plugin', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-tsserver', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'josa42/coc-go', {'do': 'npx yarn install --frozen-lockfile'}
  Plug 'josa42/coc-sh', {'do': 'npx yarn install --frozen-lockfile'}

""" UI

  " Lightline
  " see lightlineSettings for more
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'

  " Icon theme
  Plug 'flazz/vim-colorschemes'

  " GitGutter
  " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
  Plug 'airblade/vim-gitgutter'

  " HighlightedYank
  " Briefly highlight the yanked text
  Plug 'machakann/vim-highlightedyank'

""" Syntaxes

  " One syntax plugin to rule them all
  Plug 'sheerun/vim-polyglot'

call plug#end()


augroup easymotionSettings
  set nohlsearch
  set smartcase
  let g:EasyMotion_move_highlight = 0
  let g:EasyMotion_landing_highlight = 1
  let g:EasyMotion_smartcase = 1
  map <Leader> <Plug>(easymotion-prefix)
  map  / <Plug>(incsearch-easymotion-/)
  map  ? <Plug>(incsearch-easymotion-?)
  omap / <Plug>(easymotion-tn)
  map  <Leader>l <Plug>(easymotion-lineforward)
  map  <Leader>j <Plug>(easymotion-j)
  map  <Leader>k <Plug>(easymotion-k)
  map  <Leader>h <Plug>(easymotion-linebackward)
augroup END

augroup fzfSettings
  nmap <C-p> :GFiles<cr>
  nmap <C-o> :Files<cr>
  nmap <C-t> :Buffers<cr>
  nmap <leader>/ :Rg<cr>
  nmap <leader>d :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>
  nmap <leader>g :Rg <c-r>=expand("<cword>")<CR><CR>
  let g:fzf_nvim_statusline = 0
  autocmd! FileType fzf
  autocmd FileType fzf set laststatus=0 | autocmd BufLeave <buffer> set laststatus=2
augroup END

augroup fugitiveSettings
  nnoremap <Leader>gs :Gministatus<CR>
  nnoremap <Leader>gc :Gcommit -v -q<CR>
  nnoremap <Leader>gd :Gdiff<CR>
  nnoremap <Leader>+ :diffput<CR>
  nnoremap <Leader>- :diffget<CR>
augroup END

augroup lightlineSettings
  let g:lightline = {
  \ 'separator': {
  \   'left': "\ue0b0",
  \   'right': "\ue0b2",
  \ },
  \ 'subseparator': {
  \   'left': "\ue0b1",
  \   'right': "\ue0b3",
  \ },
  \ 'component': {
  \   'filename': '%f',
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers',
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel',
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status'
  \ },
  \ 'component_raw': {
  \   'buffers': 1,
  \ },
  \ 'active': {
  \   'right': [ [ 'lineinfo' ], [ 'cocstatus' ] ],
  \ },
  \ 'tabline': {
  \   'left': [ [ 'buffers' ] ],
  \   'right': [ [] ],
  \ },
  \ 'mode_map': {
  \   '__' : '-',
  \   'n'  : 'N',
  \   'i'  : 'I',
  \   'R'  : 'R',
  \   'c'  : 'C',
  \   'v'  : 'v',
  \   'V'  : 'V',
  \   '' : '^V',
  \   's'  : 's',
  \   'S'  : 'S',
  \   '' : '^S',
  \   't'  : 't',
  \ },
  \}
  let g:lightline#bufferline#filename_modifier = ':~'
  let g:lightline#bufferline#clickable = 1
  let g:lightline#bufferline#unicode_symbols = 1
augroup END

augroup cocSettings
  " Enter expands snippets
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<tab>"
  nmap <Leader>o :CocList outline<cr>
  nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
  nmap <silent> <C-j> <Plug>(coc-diagnostic-next)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <leader>r <Plug>(coc-rename)
  xmap <leader>r <Plug>(coc-rename)
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)
  let g:coc_status_error_sign = 'E'
  autocmd CursorHold * silent if CocHasProvider('hover') | call CocActionAsync('doHover') | end
  autocmd CursorHoldI * silent if CocHasProvider('hover') | call CocActionAsync('doHover') | end
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd CursorHoldI * silent call CocActionAsync('highlight')

  autocmd FileType vim,javascript,typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

augroup javascriptSyntaxSettings
  let g:javascript_plugin_jsdoc = 1
  let g:javascript_plugin_flow = 1
  let g:vim_json_syntax_conceal = 0
augroup end

""" Syntaxes

" settings
set hidden                           " allow changing buffers even if existing buffer has changes
set list                             " show hidden characters
set listchars=tab:▸\ ,eol:¬,space:·  " show _these_ hidden characters
set ignorecase                       " search case insensitive by default
set nocompatible                     " disable backwards compat features
set mouse=a                          " enable mouse support
set number                           " enable line numbers
set nowrap                           " disable line wrapping
set ts=2 sts=2 sw=2 et               " make tabs 2 spaces, but use softtabs
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1  " attempt to make things true-color
set lazyredraw                       " attempt to speed up redrawing
set ttyfast                          " attempt to speed up redrawing
set nofoldenable                     " disable annoying folding
set nobackup                         " disable backups
set nowritebackup                    " disable backups
set inccommand=nosplit               " enable inccommand
set fillchars+=vert:│                " use correct character for split window divider
set updatetime=300
set noshowmode                       " disable vim's default mode line (e.g. `--INSERT--`)
set showtabline=2                    " Always show the tab line
set laststatus=2
set cole=0
set shortmess+=c                     " Don't pass messages to |ins-completion-menu|
set signcolumn=yes
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

if has('autocmd')
  augroup syntaxes
    autocmd!
    autocmd BufNewFile,BufReadPost git-rebase-todo set filetype=gitrebase
    autocmd BufNewFile,BufReadPost gitconfig set filetype=gitconfig
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    autocmd BufNewFile,BufReadPost *.flow set filetype=javascript
    autocmd BufNewFile,BufRead *.ts  set filetype=typescript
    autocmd BufNewFile,BufReadPost tigrc set filetype=vimrc
    autocmd BufNewFile,BufReadPost Vagrantfile set filetype=ruby
  augroup END
  augroup autocursor
    " try to save/restore cursor position on a particular file.
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
    " ensure commit messages, when opened, put cursor at the end of the first line and begin editing
    autocmd BufReadPost COMMIT_EDITMSG exe "normal gg" | startinsert!
  augroup END
  augroup initvim
    autocmd!
    autocmd BufWritePost ~/.config/nvim/init.vim nested source %
  augroup END
  augroup speeling
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd FileType gitcommit setlocal spell
  augroup END
  augroup better-markdown
    autocmd BufNewFile,BufRead *.md set linebreak
    autocmd BufNewFile,BufRead *.md set wrap
    autocmd BufNewFile,BufRead *.md set cole=0
  augroup END

  autocmd FileType json syntax match Comment +\/\/.\+$+
end

" extra keybindings
vnoremap . :normal .<CR>
nnoremap <esc> :

" movement remaps
noremap H ^
noremap L g_


" markdown settings
let g:markdown_fenced_languages = ['ruby', 'erb=ruby', 'sh', 'yaml', 'javascript', 'js=javascript', 'json=javascript', 'html', 'css', 'sass']
let g:markdown_syntax_conceal = 0
" When in markdown, having selected some text, press Ctrl+K to have it wrapped
" in [](). So `foo` becomes `[foo]()` with the cursor placed inbetween ()
xmap <C-k> "zdi[<C-R>z]()<Left>

augroup colorSettings
  set t_Co=256
  set background=dark
  colorscheme PaperColor
  augroup noBackground
    hi Normal guibg=NONE ctermbg=NONE
    hi NonText guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
  augroup end
  if &background ==# "dark"
    hi Normal guibg=#000000
    hi NonText ctermfg=240
    hi SpecialKey ctermfg=240
    hi Search cterm=NONE ctermfg=NONE ctermbg=240
    hi CursorLineNr ctermfg=250
  else
    let g:airline_theme = 'papercolor'
    hi NonText ctermfg=250
    hi SpecialKey ctermfg=254
    hi Search cterm=NONE ctermfg=NONE ctermbg=254
    hi CursorLineNr ctermfg=3
  endif
augroup END

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
