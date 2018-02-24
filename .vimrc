set nocompatible
set t_Co=256


" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'        " Base16 theming architecture
Plug 'vim-airline/vim-airline'        " Status line
Plug 'vim-airline/vim-airline-themes' " Status line themes
Plug 'scrooloose/nerdtree'            " File system browser
Plug 'ludovicchabant/vim-gutentags'   " Tag generation
Plug 'majutsushi/tagbar'              " Tag browser
Plug 'mbbill/undotree'                " Undo tree
Plug 'Valloric/ListToggle'            " Quickfix/Location toggler
Plug '/usr/local/opt/fzf'             " Fzf fuzzy finder
Plug 'junegunn/fzf.vim'               " Fzf vim wrapper
Plug 'airblade/vim-gitgutter'         " Git gutters
Plug 'tpope/vim-fugitive'             " Git commands
Plug 'tpope/vim-rhubarb'              " Github commands
Plug 'sheerun/vim-polyglot'           " Language pack
Plug 'vim-syntastic/syntastic'        " Linter wrapper
Plug 'tpope/vim-commentary'           " Code commenting
Plug 'ap/vim-css-color'               " CSS colour rendering
Plug 'janko-m/vim-test'               " Test runner
Plug 'jiangmiao/auto-pairs'           " Insert brackets, quotes, etc. in pairs
Plug 'ervandew/supertab'              " Tab completion
Plug 'SirVer/ultisnips'               " Snippets
Plug 'ntpeters/vim-better-whitespace' " Highlight and trim whitespace
Plug 'tpope/vim-unimpaired'           " Handy bracket mappings
Plug 'tpope/vim-surround'             " Surround commands
Plug 'tpope/vim-repeat'               " Better . repeating
Plug 'qpkorr/vim-bufkill'             " Close buffer without closing window or split
Plug 'junegunn/goyo.vim'              " Distraction free writing
Plug 'junegunn/vim-easy-align'        " Text alignment
Plug 'junegunn/limelight.vim'         " Hyper focus writing
Plug 'tobyS/vmustache'                " PHP docblocks dependency
Plug 'tobyS/pdv'                      " PHP docblocks
Plug 'arnaud-lb/vim-php-namespace'    " PHP namespace importer
Plug 'mattn/emmet-vim'                " HTML/CSS expand abbreviation magic

call plug#end()


" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------

" Leader
let mapleader = "\<Space>"

" Esc / Ctrl-c
imap jk <Esc>
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>
cnoremap jk <C-c>

" Write
nmap <Leader>w :w<CR>
map <D-s> <Esc>:w<CR>
map <M-s> <Esc>:w<CR>
map <C-s> <Esc>:w<CR>

" Edit .vimrc
nmap <Leader><Leader>v :Vimrc<CR>

" Windows
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W
nnoremap <Leader>o <C-w>o

" Close buffer, and disable intrusive BuffKill mappings
let g:BufKillCreateMappings = 0
nmap <Leader>c :BD<CR>

" Next/prev git change, and disable intrusive GitGutter mappings
let g:gitgutter_map_keys = 0
nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk

" Fzf fuzzy finder
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>h :History<CR>
nmap <Leader><Leader>h: :History:<CR>
nmap <Leader><Leader>h/ :History/<CR>
nmap <Leader>H :Helptags!<CR>
nmap <Leader>m :Marks<CR>
nmap <Leader>M :Maps<CR>
nmap <Leader>s :Snippets<CR>
nmap <Leader>ss :Filetypes<CR>

" Search project
nmap <Leader><Leader>f :Ag<Space>
nmap <Leader><Leader>F :Agr<Space>

" Run tests
nmap <Leader>rs :w<CR>:TestSuite<CR>
nmap <Leader>rf :w<CR>:TestFile<CR>
nmap <Leader>rl :w<CR>:TestLast<CR>
nmap <Leader>rn :w<CR>:TestNearest<CR>

" Panel toggles
nmap <Leader><Tab> :NERDTreeToggle<CR>
nmap <Leader><Leader><Tab> :NERDTree<CR>
nmap <Leader><Leader><Tab>f :NERDTreeFind<CR>zz
nmap <Leader>\ :TagbarToggle<CR>
nmap <Leader><Leader>u :UndotreeToggle<CR>
let g:lt_quickfix_list_toggle_map = '<Leader><Leader>q'
let g:lt_location_list_toggle_map = '<Leader><Leader>l'

" Delete text on line
nmap <Leader>d ddO<Esc>

" Open lines, but stay in normal mode
nmap <S-CR> O<Esc>
nmap <CR> o<Esc>

" Quickly append semicolon or comma
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" Add a bit of breathing room around zt and zb
nmap zt zt<C-y><C-y>
nmap zb zb<C-e><C-e>

" Keep visual selection when indenting
xnoremap > >gv
xnoremap < <gv

" Move line(s) up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" EasyAlign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" UltiSnips
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Generate PHP docblock
nnoremap <Leader>/** :call pdv#DocumentWithSnip()<CR>


" ------------------------------------------------------------------------------
" Settings
" ------------------------------------------------------------------------------

set hidden
set autoread
set confirm
set wildmenu
set encoding=utf-8
set clipboard=unnamed
set backspace=indent,eol,start
set relativenumber
set incsearch
set fillchars+=vert:\ ,                        " Vertical split character
call matchadd('ColorColumn', '\%121v', 100)    " Only show 121st character on lines that might exceed 120

let g:NERDTreeWinSize=45

let g:pdv_template_dir = $HOME . "/.vim/plugged/pdv/templates_snip"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = '--standard=PSR2 -n'
let g:syntastic_error_symbol = '!'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = '!'
let g:syntastic_style_warning_symbol = '!'


" ------------------------------------------------------------------------------
" Theming
" ------------------------------------------------------------------------------

"let base16colorspace=256
colorscheme base16-monokai
set hlsearch
highlight Normal ctermbg=none                                 " Use terminal background
highlight NonText ctermbg=none                                " Use terminal background
highlight Search ctermbg=blue ctermfg=white                   " Search matches
highlight Visual ctermbg=black ctermfg=white                  " Visual selection
highlight LineNr ctermbg=none                                 " Gutter
highlight CursorLineNR ctermbg=green ctermfg=none             " Gutter
highlight SignColumn ctermbg=none                             " Git gutter
highlight ColorColumn ctermbg=black                          " Highlighting
highlight GitGutterAdd ctermbg=none ctermfg=green             " Git gutter
highlight GitGutterChange ctermbg=none ctermfg=yellow         " Git gutter
highlight GitGutterDelete ctermbg=none ctermfg=red            " Git gutter
highlight GitGutterChangeDelete ctermbg=none ctermfg=red      " Git gutter
highlight VertSplit ctermbg=none ctermfg=none                 " Vert split
highlight CursorLine ctermbg=black ctermfg=none               " Cursor line for nerd tree?
highlight QuickFixLine ctermbg=black ctermfg=none             " Quickfix selection
highlight SyntasticErrorSign ctermbg=none ctermfg=red
highlight SyntasticWarningSign ctermbg=none ctermfg=magenta
highlight SyntasticStyleErrorSign ctermbg=none ctermfg=red
highlight SyntasticStyleWarningSign ctermbg=none ctermfg=magenta


" ------------------------------------------------------------------------------
" Commands
" ------------------------------------------------------------------------------

command! Vimrc edit $MYVIMRC


" ------------------------------------------------------------------------------
" Auto Commands
" ------------------------------------------------------------------------------

augroup misc_commands
  autocmd!
  autocmd BufWritePost .vimrc source % " Auto source vimrc
  autocmd FileType help wincmd o " Always fullscreen help window
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * checktime " Trigger autoread and/or ask to load file
  autocmd BufEnter * EnableStripWhitespaceOnSave " Remove whitespace on save
  autocmd BufReadPost quickfix nested nmap <buffer> <CR> <CR>
augroup END

augroup filetype_settings
  autocmd!
  autocmd FileType javascript setlocal ts=4 sw=4 sts=4 expandtab
  autocmd FileType vue setlocal ts=4 sw=4 sts=4 expandtab commentstring=//\ %s
  autocmd FileType vue syntax sync fromstart
  autocmd FileType scss setlocal ts=4 sw=4 sts=4 expandtab
  autocmd FileType css setlocal ts=4 sw=4 sts=4 expandtab
  autocmd FileType vim setlocal ts=2 sw=2 sts=2 expandtab
  autocmd FileType zsh setlocal ts=2 sw=2 sts=2 expandtab
  autocmd FileType less setlocal ts=2 sw=2 sts=2 expandtab
  autocmd FileType html setlocal ts=4 sw=4 sts=4 expandtab
  autocmd FileType php setlocal ts=4 sw=4 sts=4 expandtab commentstring=//\ %s
  autocmd FileType snippets setlocal ts=4 sw=4 sts=4 expandtab
augroup END


" ------------------------------------------------------------------------------
" Fzf
" ------------------------------------------------------------------------------

let $FZF_DEFAULT_OPTS = '--extended --bind ctrl-a:select-all'

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

command! -bang -nargs=+ -complete=dir Agr
  \ call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter :'}, <bang>0)

" ------------------------------------------------------------------------------
" Experimenting
" ------------------------------------------------------------------------------

 " Hacky workaround to Hyper from pasting clipboard randomly when opening buffers
augroup hyper_hacks
  autocmd!
  autocmd BufEnter * silent! earlier 1f
  autocmd BufReadPost * silent! earlier 1f
augroup END

augroup goyo_events
  autocmd!
  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup END

if !exists("*s:goyo_enter")
  function! s:goyo_enter()
    Limelight
  endfunction
endif

if !exists("*s:goyo_leave")
  function! s:goyo_leave()
    Limelight!
    so $MYVIMRC
  endfunction
endif

let g:limelight_conceal_ctermfg = 'black'

if has("gui_running")
  set guioptions=
  set guifont=Menlo\ LG100
endif

