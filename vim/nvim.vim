call plug#begin('~/.vim/plugged')
  " navigation
  Plug 'easymotion/vim-easymotion'
  Plug 'ctrlpvim/ctrlp.vim'
  " project tools
  Plug 'neomake/neomake'
  Plug 'editorconfig/editorconfig-vim'
  " editing tools
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdcommenter'
  Plug 'mattn/emmet-vim'
  " autocomplete
  Plug 'ervandew/supertab'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " git
  Plug 'airblade/vim-gitgutter'
  Plug 'terryma/vim-multiple-cursors'
  " syntaxes
  Plug 'mxw/vim-jsx'
  Plug 'fleischie/vim-styled-components'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'othree/yajs.vim'
  Plug 'othree/es.next.syntax.vim'
  Plug 'leshill/vim-json'
  Plug 'dag/vim-fish'
  Plug 'tpope/vim-markdown'
  " misc
  Plug 'mhinz/neovim-remote'
  Plug 'tpope/vim-sensible'
  " ui
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'crusoexia/vim-monokai'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhinz/vim-startify'
call plug#end()

" settings
set hidden                           " allow changing buffers even if existing buffer has changes
set list                             " show hidden characters
set listchars=tab:▸\ ,eol:¬,space:·  " show _these_ hidden characters
set hlsearch                         " highlight search terms
set ignorecase                       " search case insensitive by default
set nocompatible                     " disable backwards compat features
set mouse=a                          " enable mouse support
set number                           " enable line numbers
set nowrap
set ts=2 sts=2 sw=2 et
set clipboard=unnamed
colorscheme monokai
let g:netrw_preview = 1


" syntaxes
if has('autocmd')
  autocmd BufNewFile,BufRead git-rebase-todo set filetype=gitrebase
  autocmd BufNewFile,BufRead gitconfig set filetype=gitconfig
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  autocmd BufNewFile,BufReadPost tigrc set filetype=vimrc
  autocmd BufNewFile,BufReadPost Vagrantfile set filetype=ruby
end

" extra keybindings
vnoremap . :normal .<CR>

" colors
hi NonText ctermfg=240 
hi SpecialKey ctermfg=240
hi Search cterm=NONE ctermfg=NONE ctermbg=240

" bindings!
map <C-s> :w<cr>
imap <C-s> <esc>:w<cr>i
map <C-q> :q<cr>
imap <C-q> <esc>:q<cr>

" markdown settings
let g:markdown_fenced_languages = ['ruby', 'erb=ruby', 'sh', 'yaml', 'javascript', 'js=javascript', 'json=javascript', 'html', 'css', 'sass']
let g:markdown_syntax_conceal = 0

" ctrlp settings
let g:ctrlp_user_command = ['.git', 'cd %s; git ls-files -co --exclude-standard']

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

" vim-indent-guides settings
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_default_mapping = 0
hi IndentGuidesOdd  ctermbg=236
hi IndentGuidesEven ctermbg=236

" neomake settings
let g:neomake_open_list=2
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_jsx_enabled_makers = ['eslint', 'flow']

" deoplete settings
let g:deoplete#enable_at_startup = 1
