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

  " Underling matching words in the buffer
  Plug 'itchyny/vim-cursorword'

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

  " Adds `:Test[File|Nearest|Suite|Last|Visit]` commands
  Plug 'janko-m/vim-test'

  " Adds `:Dash` command
  Plug 'rizzatti/dash.vim'

  " Adds capabilities for custom per-project start pages
  Plug 'keithamus/vimstart'

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

  " rebind P/p to handle whitespace and indentation better
  Plug 'AndrewRadev/whitespaste.vim'
  Plug 'sickill/vim-pasta'

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

""" Autocompletion

  " autocomplete brackets/quotes!
  Plug 'Raimondi/delimitMate'

  " COC Completion Engine
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

""" UI

  " Airline
  " see airlineSettings for more
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " IndentLine
  " A vim plugin to display the indention levels with thin vertical lines
  " see indentlineSettings for more
  Plug 'Yggdroot/indentLine'

  " Icon theme
  Plug 'flazz/vim-colorschemes'

  " GitGutter
  " A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
  Plug 'airblade/vim-gitgutter'

  " HighlightedYank
  " Briefly highlight the yanked text
  Plug 'machakann/vim-highlightedyank'


""" Per-Language Plugins

  " Enable `gf` on `require()` calls
  Plug 'moll/vim-node', { 'for': 'javascript' }

  " javascript related completions and syntaxes
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

  " json syntax highlighting
  Plug 'elzr/vim-json', { 'for': 'json' }

  " fish syntax highlighting
  Plug 'dag/vim-fish', { 'for': 'fish' }

  " markdown syntax highlighting
  Plug 'tpope/vim-markdown'

  " html syntax highlighting
  Plug 'othree/html5.vim', { 'for': 'html' }

  " css syntax highlighting
  Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'scss' ] }

  " liquid template (jekyll) syntax highlighting
  Plug 'tpope/vim-liquid', { 'for': ['html', 'md', 'liquid' ] }

  " A whole bunch of cool Go commands and highlighting
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

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
  function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
          \   'converters': [incsearch#config#fuzzyword#converter()],
          \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
          \   'keymap': {"\<CR>": '<Over>(easymotion)'},
          \   'is_expr': 0,
          \   'is_stay': 1
          \ }), get(a:, 1, {}))
  endfunction
  noremap <silent><expr> <Leader>/ incsearch#go(<SID>config_easyfuzzymotion())
augroup END

augroup fzfSettings
  nmap <C-p> :GFiles<cr>
  nmap <C-o> :Files<cr>
  nmap <C-t> :Buffers<cr>
  nmap <leader>/ :Ag<cr>
  nmap <leader>d :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>
  nmap <leader>g :Ag <c-r>=expand("<cword>")<CR><CR>
  let g:fzf_nvim_statusline = 0
  autocmd! FileType fzf
  autocmd FileType fzf set laststatus=0 | autocmd BufLeave <buffer> set laststatus=2
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
  let g:ale_linters = {
  \   'javascript': ['eslint', 'flow'],
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
augroup END

augroup easyalignSettings
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
augroup END

augroup refactorMappings
  nmap <leader>r 1gdvaio:s/<C-R>///gc<left><left><left>
  xmap <leader>r "cyvaio:s/<C-R>c//gc<left><left><left>
augroup END

augroup gitgutterSettings
  let g:gitgutter_sign_added = ''
  let g:gitgutter_sign_removed = ''
  let g:gitgutter_sign_modified = ''
  let g:gitgutter_sign_modified_removed = ''
augroup END

augroup fugitiveSettings
  nnoremap <Leader>gs :Gministatus<CR>
  nnoremap <Leader>gc :Gcommit -v -q<CR>
  nnoremap <Leader>gd :Gdiff<CR>
  nnoremap <Leader>+ :diffput<CR>
  nnoremap <Leader>- :diffget<CR>
augroup END

augroup airlineSettings
  let g:airline_extensions = ['tabline']
  let g:airline#extensions#tabline#show_splits = 1
  let g:airline#extensions#tabline#buffers_label = '*'
  " let g:airline#extensions#tabline#formatter = 'custom'
  let g:airline_powerline_fonts = 1
  let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'c'  : 'C',
        \ 'v'  : 'v',
        \ 'V'  : 'V',
        \ '' : '^V',
        \ 's'  : 's',
        \ 'S'  : 'S',
        \ '' : '^S',
        \ 't'  : 't',
        \ }
  let g:airline_skip_empty_sections = 1
  " let g:airline_section_a = ''
  let g:airline_section_b = ''
  let g:airline_section_c = ' '
  let g:airline_section_x = '%f:%3l:%2v'
  let g:airline_section_y = ''
  let g:airline_section_z = ''
  let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' " dont show expected file format
  let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
  let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
  set noshowmode " disable vim's default mode line (e.g. `--INSERT--`)
augroup END

augroup indentlineSettings
  let g:indentLine_char = '│'
  let g:indentLine_color_term = 236
augroup END

augroup vimTestSettings
  nmap <silent> <leader>t :TestNearest<CR>
  nmap <silent> <leader>T :TestFile<CR>
  let test#strategy = "neovim"
augroup END

augroup cocSettings
  " Enter expands snippets
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<tab>"
  nmap <Leader>o :CocList outline<cr>
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
set inccommand=nosplit               " enable inccommand
set fillchars+=vert:│

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
  colorscheme papercolor
  augroup noBackground
    hi Normal guibg=NONE ctermbg=NONE
    hi NonText guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
  augroup end
  if &background ==# "dark"
    let g:airline_theme = 'wombat'
    let g:indentLine_color_term = 240
    hi Normal guibg=#000000
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
