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

""" Project Tools

  " ALE
  " Asynchronous linting and make framework for Neovim/Vim
  " see augroup aleSettings for more
  Plug 'w0rp/ale'


  " Editorconfig
  " Reads .editorconfig files and cleans up files on save
  Plug 'editorconfig/editorconfig-vim'

  " Fugitive
  " Adds a bunch of helpful git commands to Vim
  Plug 'tpope/vim-fugitive'

  " Rhubarb adds GitHub support to fugitive
  Plug 'tpope/vim-rhubarb'

  " Provides a minimum `:GStatus` window, rather than fugitives rather verbose one
  Plug 'alexdavid/vim-min-git-status'

  " Adds `:Test[File|Nearest|Suite|Last|Visit]` commands
  Plug 'janko-m/vim-test'

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

  " bunch of cool keyboard combos
  Plug 'tpope/vim-unimpaired'

  " enable . repeating for a bunch of plugins
  Plug 'tpope/vim-repeat'

  " ga<letter> ga*<letter> to align code
  " see easyalignSettings for more
  Plug 'junegunn/vim-easy-align'

  " cx{motion} store a value to exchange with the next cx
  Plug 'tommcdo/vim-exchange'

""" TextObject Plugins!

  " User definable TextObjects using regex or functions
  Plug 'kana/vim-textobj-user'

  " ai/ii - select region at this indent and further
  " aI/iI - select region at this indent alone
  Plug 'michaeljsmith/vim-indent-object'

  " af/if - select function
  Plug 'kana/vim-textobj-function'
  Plug 'thinca/vim-textobj-function-javascript'

  " aa/ia - select argument in function call
  Plug 'vim-scripts/argtextobj.vim'

  " ad/id - select date, at/it - select time
  Plug 'kana/vim-textobj-datetime'

  " ah/ih - select git hunk
  Plug 'gilligan/textobj-gitgutter'

  " ax/ix - select (X|HT)ML attributes
  Plug 'whatyouhide/vim-textobj-xmlattr'

  " ac/ic - select CSS rules+selectors
  Plug 'jasonlong/vim-textobj-css'

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

  " ternjs autocomplete
  Plug 'ternjs/tern_for_vim', { 'do': 'npm i' }

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
  Plug 'flazz/vim-colorschemes'

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
  Plug 'facebook/vim-flow', { 'for': 'javascript' }

  Plug 'dag/vim-fish', { 'for': 'fish' }
  Plug 'tpope/vim-markdown'
  Plug 'othree/html5.vim', { 'for': 'html' }
  Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'scss' ] }
  Plug 'tpope/vim-liquid', { 'for': ['html', 'md', 'liquid' ] }

""" Misc

  Plug 'mhinz/neovim-remote', { 'do': 'pip3 install neovim-remote' }

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
  let g:fzf_nvim_statusline = 0
augroup END

augroup aleSettings
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
  let g:flow#showquickfix = 0
  let g:ale_sign_column_always = 1
  let g:ale_sign_error = ''
  let g:ale_sign_warning = ''
  " let g:ale_fix_on_save = 1
  let g:ale_fixers = {
  \   'javascript': ['remove_trailing_lines', 'trim_whitespace', 'eslint'],
  \}
augroup END

augroup switchSettings
  autocmd FileType javascript let b:switch_custom_definitions =
        \ [
        \   {
        \      '\<\([a-zA-z.()]\+\) === false': '!\1',
        \      '!\<\([a-zA-z.()]\+\)':          '\1 === false',
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
        \   { '^p ': 'fixup ' },
        \   { '^f ': 'reword ' },
        \   { '^r ': 'edit ' },
        \   { '^e ': 'squash ' },
        \   { '^s ': 'exec ' },
        \   { '^x ': 'drop ' },
        \   { '^d ': 'pick ' },
        \ ]
augroup END

augroup clipboardSettings
  " This adds a <leader>Y and <leader>P commands which yank/paste the text to
  " the clipboard register
  set clipboard= " set clipboard as nothing
  nnoremap <leader>y "*y
  nnoremap <leader>Y "*Y
  nnoremap <leader>p "*p
  nnoremap <leader>P "*P
  vnoremap <leader>y "*y
  vnoremap <leader>Y "*Y
  vnoremap <leader>p "*p
  vnoremap <leader>P "*P
augroup END

augroup easyalignSettings
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
augroup END

augroup refactorMappings
  nmap <leader>r 1gdvaio:s/<C-R>///gc<left><left><left>
  xmap <leader>r "cyvaio:s/<C-R>c//gc<left><left><left>
augroup END

augroup ultisnipsSettings
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/vim-snippets/Ultisnips']
  let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'
  autocmd FileType js UltiSnipsAddFiletypes javascript-node
  autocmd FileType js UltiSnipsAddFiletypes javascript-mocha
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

augroup gitgutterSettings
  let g:gitgutter_sign_added = ''
  let g:gitgutter_sign_removed = ''
  let g:gitgutter_sign_modified = ''
  let g:gitgutter_sign_modified_removed = ''
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
  let g:airline_section_b = ''
  let g:airline_section_x = ''
  let g:airline_section_y = ''
  let g:airline_section_z = "%{g:airline_symbols.maxlinenr}%3l/%3L:%3v%#__restore__#"
  let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' " dont show expected file format
  set noshowmode " disable vim's default mode line (e.g. `--INSERT--`)
augroup END

augroup indentlineSettings
  let g:indentLine_char = '│'
  let g:indentLine_color_term = 236
augroup END

augroup vimTestSettings
  nmap <silent> <leader>t :TestNearest<CR>
  nmap <silent> <leader>T :TestFile<CR>
  let test#strategy="neovim"
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
nnoremap <esc> :

" movement remaps
noremap H ^
noremap L g_


" markdown settings
let g:markdown_fenced_languages = ['ruby', 'erb=ruby', 'sh', 'yaml', 'javascript', 'js=javascript', 'json=javascript', 'html', 'css', 'sass']
let g:markdown_syntax_conceal = 0

augroup colorSettings
  set t_Co=256
  set background=light
  colorscheme papercolor
  if &background ==# "dark"
    let g:airline_theme = 'wombat'
    let g:indentLine_color_term = 240
    hi NonText ctermfg=240
    hi SpecialKey ctermfg=240
    hi Search cterm=NONE ctermfg=NONE ctermbg=240
    hi CursorLineNr ctermfg=250
  else
    let g:airline_theme = 'papercolor'
    let g:indentLine_color_term = 254
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
