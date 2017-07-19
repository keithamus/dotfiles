call plug#begin('~/.vim/plugged')

""" Navigation

  " EasyMotion (Vim motions on speed!) & Incsearch (Improved incremental searching for Vim)
  " Provides more useful UI for searching text across files
  " see augroup easymotionSettings for more
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'

  " FZF Fuzzy Search
  " Allows for quickly finding/searching across files
  " see augroup fzfSettings for more
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  
  " smooth/velocity trackpad scrolling in vim
  Plug 'yuttie/comfortable-motion.vim'

""" Project Tools

  " NERDTree
  " A tree explorer plugin for vim.
  " see augroup nerdtreeSettings for more
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

  " Neomake
  " Asynchronous linting and make framework for Neovim/Vim
  " see augroup neomakeSettings for more
  Plug 'neomake/neomake'


  " Editorconfig
  " Reads .editorconfig files and cleans up files on save
  Plug 'editorconfig/editorconfig-vim'

""" Editing tools

  " Switch - between variants of different lines/vars
  " see switchSettings for more
  Plug 'AndrewRadev/switch.vim'

  " Add keymaps to S to surround selections in characters
  Plug 'tpope/vim-surround'

  " Expand utility of ^+A
  Plug 'tpope/vim-speeddating'

  " gcc to toggle comments
  Plug 'tpope/vim-commentary'

  " gt<movement> for title casing
  Plug 'christoomey/vim-titlecase'

  " Make the clipboard behave more like other editors
  " see clipboardSettings for more
  Plug 'svermeulen/vim-easyclip'

  " Add `+` key to expand selection to "smart regions"
  Plug 'terryma/vim-expand-region'

  " bunch of cool keyboard combos
  Plug 'tpope/vim-unimpaired'

  " enable . repeating for a bunch of plugins
  Plug 'tpope/vim-repeat'

  " ga<letter> ga*<letter> to align code
  " see easyalignSettings for more
  Plug 'junegunn/vim-easy-align'

  " cx{motion} store a value to exchange with the next cx
  Plug 'tommcdo/vim-exchange'

  " gS to split a one-liner into multiple lines, gJ to join multiple lines
  " into one - without breaking syntax!
  Plug 'AndrewRadev/splitjoin.vim'

""" Autocompletion & Snippets

  " autocomplete brackets/quotes!
  Plug 'Raimondi/delimitMate'

  " Deoplete
  " see deopleteSettings for more
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " snippets
  Plug 'SirVer/ultisnips'

  Plug 'honza/vim-snippets'

  " javascript autocomplete
  Plug '1995eaton/vim-better-javascript-completion', { 'for': 'javascript' }
  Plug 'othree/jspc.vim', { 'for': 'javascript' }

""" UI

  " Airline
  " see airlineSettings for more
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " IndentLine
  " A vim plugin to display the indention levels with thin vertical lines
  " see indentlineSettings for more
  Plug 'Yggdroot/indentLine'

  " Devicons
  " Adds file type glyphs/icons to popular Vim plugins
  Plug 'ryanoasis/vim-devicons'

  " Icon theme
  Plug 'crusoexia/vim-monokai'

  " GitGutter
  " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
  Plug 'airblade/vim-gitgutter'


""" Syntaxes

  " javascript related completions and syntaxes
  Plug 'moll/vim-node', { 'for': 'javascript' }
  Plug 'mxw/vim-jsx', { 'for': 'javascript' }
  Plug 'fleischie/vim-styled-components', { 'for': 'javascript' }
  Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'leshill/vim-json', { 'for': 'json' }

  Plug 'dag/vim-fish', { 'for': 'fish' }
  Plug 'tpope/vim-markdown'
  Plug 'othree/html5.vim', { 'for': 'html' }
  Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'scss' ] }
  Plug 'tpope/vim-liquid', { 'for': ['html', 'md', 'liquid' ] }

""" Misc

  Plug 'mhinz/neovim-remote'

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
  map  n <Plug>(easymotion-next)
  map  N <Plug>(easymotion-prev)
  map  <Tab> <Plug>(easymotion-next)
  map  <S-Tab> <Plug>(easymotion-prev)
  function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
          \   'converters': [incsearch#config#fuzzyword#converter()],
          \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
          \   'keymap': {"\<CR>": '<Over>(easymotion)'},
          \   'is_expr': 0,
          \   'is_stay': 1
          \ }), get(a:, 1, {}))
  endfunction
  noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
augroup END

augroup fzfSettings
  imap <C-p> <esc>:GFiles<cr>
  nmap <C-p> :GFiles<cr>
  imap <C-F> <esc>:Ag<space>
  nmap <C-F> :Ag<space>
  let g:fzf_nvim_statusline = 0
augroup END

augroup nerdtreeSettings
  nmap <C-\> :NERDTreeToggle<cr>
  imap <C-\> <esc>:NERDTreeToggle<cr>  " make NERDTree toggleable with Ctrl+/
  let g:loaded_netrw = 1
  let g:loaded_netrwPlugin = 1
  " allow nerdtree to load when run `nvim .` or `nvim`
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
augroup END

augroup neomakeSettings
  if has('autocmd')
    autocmd! BufWritePost,BufEnter * Neomake
  end
augroup END


augroup switchSettings
  let g:switch_mapping = ""
  nnoremap <c-s> :Switch<cr>
  autocmd FileType javascript let b:switch_definitions =
        \ [
        \   [ 'false', 'true' ],
        \   {
        \     'function \(\k\+\)(':              'var \1 = function (',
        \     '\%(var \)\=\(\k\+\) = function (': 'function \1(',
        \   },
        \   {
        \     'function\s*()\s*{':                        '() => {',
        \     'function\s*(\([^()]\{-},[^()]\{-}\))\s*{': '(\1) => {',
        \     'function\s*(\(\k\+\))\s*{':                '\1 => {',
        \     '(\([^()]\{-}\))\s*=>\s*{':                 'function (\1) {',
        \     '\(\k\+\)\s*=>\s*{':                        'function (\1) {',
        \   },
        \   {
        \     'describe(\(.*\)': 'describe.skip(\1',
        \     'describe\.skip(\(.*\)': 'describe.only(\1',
        \     'describe\.only(\(.*\)': 'describe(\1',
        \   },
        \   {
        \     '\(\s*\)it(\(.*\)': '\1it.skip(\2',
        \     '\(\s*\)it\.skip(\(.*\)': '\1it.only(\2',
        \     '\(\s*\)it\.only(\(.*\)': '\1it(\2',
        \   },
        \ ]
  autocmd FileType gitrebase let b:switch_definitions =
        \ [
        \   [ 'pick', 'fixup', 'reword', 'edit', 'squash', 'exec', 'drop' ],
        \   [ '\^p ', 'fixup' ],
        \   [ '\^f ', 'reword ' ],
        \   [ '\^r ', 'edit' ],
        \   [ '\^e ', 'squash ' ],
        \   [ '\^s ', 'exec ' ],
        \   [ '\^x ', 'drop ' ],
        \   [ '\^d ', 'pick ' ],
        \ ]
augroup END

augroup clipboardSettings
  set clipboard=unnamed " set clipboard as unnamed (system)
augroup END

" Plug 'mattn/emmet-vim'

augroup easyalignSettings
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
augroup END

augroup deopleteSettings
  let g:deoplete#enable_at_startup = 1

  call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])

  " let g:deoplete#file#enable_buffer_path = 1

  " let g:deoplete#omni_input_patterns = get(g:, 'deoplete#omni_input_patterns', {})
  " let g:deoplete#omni_patterns = get(g:, 'deoplete#omni_patterns', {})
  " let g:deoplete#omni#functions = get(g:, 'deoplete#omni#functions', {})
  " let g:deoplete#sources = get(g:, 'deoplete#sources', {})

  " let g:deoplete#omni_patterns.javascript = '[^. *\t]\.\w*'
  " let g:deoplete#omni_input_patterns.javascript = '[^. *\t]\.\w*'
  " let g:deoplete#omni#functions.javascript = [ 'jspc#omni', 'js#CompleteJS' ]
  " let g:deoplete#sources.javascript = ['file', 'ultisnips', 'omni']
augroup END

augroup airlineSettings
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'c'  : 'C',
        \ 'v'  : 'V',
        \ 'V'  : 'V',
        \ '' : 'V',
        \ 's'  : 'S',
        \ 'S'  : 'S',
        \ '' : 'S',
        \ }
  let g:airline_skip_empty_sections = 1
  let g:airline_section_x = ''
  let g:airline_section_y = ''
  let g:airline_section_z = "%{g:airline_symbols.maxlinenr}%3l/%3L:%3v%#__restore__#"
  let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' " dont show expected file format
  let g:airline_theme = 'wombat'
  set noshowmode " disable vim's default mode line (e.g. `--INSERT--`)
augroup END

augroup indentlineSettings
  let g:indentLine_char = '│'
  let g:indentLine_color_term = 236
augroup END

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
set relativenumber                   " make line numbers relative
au FocusLost * :set relativenumber!  " bring back fixed line numbers when unfocussed
au FocusGained * :set relativenumber " bring back relative line numbers when focussed
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1  " attempt to make things true-color
set lazyredraw                       " attempt to speed up redrawing
set ttyfast                          " attempt to speed up redrawing
set nofoldenable                     " disable annoying folding


if has('autocmd')
  augroup syntaxes
    autocmd!
    autocmd BufNewFile,BufReadPost git-rebase-todo set filetype=gitrebase
    autocmd BufNewFile,BufReadPost gitconfig set filetype=gitconfig
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
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
end

" extra keybindings
vnoremap . :normal .<CR>

" movement remaps
noremap H ^
noremap L g_


" markdown settings
let g:markdown_fenced_languages = ['ruby', 'erb=ruby', 'sh', 'yaml', 'javascript', 'js=javascript', 'json=javascript', 'html', 'css', 'sass']
let g:markdown_syntax_conceal = 0

augroup equalPrograms
  au FileType json setlocal equalprg=jq\ --indent\ 4\ .
augroup END


augroup colorSettings
  colorscheme monokai
  set background=dark
  hi NonText ctermfg=240
  hi SpecialKey ctermfg=240
  hi Search cterm=NONE ctermfg=NONE ctermbg=240
  hi CursorLineNr ctermfg=250
augroup END

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
