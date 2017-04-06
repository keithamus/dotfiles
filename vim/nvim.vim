call plug#begin('~/.vim/plugged')
  " navigation
  Plug 'easymotion/vim-easymotion'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'moll/vim-node', { 'for': 'javascript' }
  " project tools
  Plug 'neomake/neomake'
  Plug 'editorconfig/editorconfig-vim'
  " editing tools
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim'
  Plug 'junegunn/vim-easy-align'
  " autocomplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " javascript autocomplete
  Plug '1995eaton/vim-better-javascript-completion', { 'for': 'javascript' }
  Plug 'othree/jspc.vim', { 'for': 'javascript' }
  " git
  Plug 'airblade/vim-gitgutter'
  " syntaxes
  Plug 'dag/vim-fish', { 'for': 'fish' }
  Plug 'tpope/vim-markdown'
  Plug 'othree/html5.vim', { 'for': 'html' }
  " javscript syntaxes
  Plug 'mxw/vim-jsx', { 'for': 'javascript' }
  Plug 'fleischie/vim-styled-components', { 'for': 'javascript' }
  Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
  Plug 'othree/yajs.vim', { 'for': 'javascript' }
  Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
  Plug 'leshill/vim-json', { 'for': 'json' }
  " misc
  Plug 'mhinz/neovim-remote'
  Plug 'tpope/vim-sensible'
  " ui
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'crusoexia/vim-monokai'
  Plug 'ryanoasis/vim-devicons'
  " snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
call plug#end()

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
set clipboard=unnamed                " set clipboard as unnamed for tmux integration

" set the colorscheme
set background=dark
colorscheme monokai

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
    " ensure commit messages, when opened, put cursor at the end of the first line
    autocmd BufReadPost COMMIT_EDITMSG exe "normal gg$"
  augroup END
  augroup initvim
    autocmd!
    " automatically source the init.vim upon save
    autocmd BufWritePost ~/.config/nvim/init.vim nested source % 
  augroup END
end

" extra keybindings
vnoremap . :normal .<CR>

" colors
hi NonText ctermfg=240 
hi SpecialKey ctermfg=240
hi Search cterm=NONE ctermfg=NONE ctermbg=240

" easymotion settings

set nohlsearch
let g:EasyMotion_move_highlight = 0
let g:EasyMotion_landing_highlight = 1
map <Leader> <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" newrw settings
let g:netrw_preview = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" markdown settings
let g:markdown_fenced_languages = ['ruby', 'erb=ruby', 'sh', 'yaml', 'javascript', 'js=javascript', 'json=javascript', 'html', 'css', 'sass']
let g:markdown_syntax_conceal = 0

" fzf settings
imap <C-p> <plug>(fzf-complete-path)
nmap <C-p> :GFiles<cr>
let g:fzf_nvim_statusline = 0

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

" vim-easy-align settings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-indent-guides settings
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_default_mapping = 0
hi IndentGuidesOdd  ctermbg=236
hi IndentGuidesEven ctermbg=236

" neomake settings
autocmd! BufWritePost,BufEnter * Neomake!

" deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#omni_input_patterns = get(g:, 'deoplete#omni_input_patterns', {})
let g:deoplete#omni_patterns = get(g:, 'deoplete#omni_patterns', {})
let g:deoplete#omni#functions = get(g:, 'deoplete#omni#functions', {})
let g:deoplete#sources = get(g:, 'deoplete#sources', {})

let g:deoplete#omni_patterns.javascript = '[^. *\t]\.\w*'
let g:deoplete#omni_input_patterns.javascript = '[^. *\t]\.\w*'
let g:deoplete#omni#functions.javascript = [ 'jspc#omni', 'js#CompleteJS' ]
let g:deoplete#sources.javascript = ['file', 'ultisnips', 'omni']

