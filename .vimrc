set shell=bash\ -i

set nocompatible
set autoindent
set modifiable
set nowrap
set nobackup
set nowritebackup
set number                      " Show line numbers
set autoread                    " Set autoread when a file is changed outside
set autowrite                   " Writes on make/shell commands
set noswapfile                  " No swap files
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set cursorline                  " Highlight current line
set hlsearch                    " Highlight all search matches
set incsearch                   " Find as you type search
set ignorecase                  " Case insensitive search
set history=100                 " Number of things to remember in history.
set laststatus=2                " Always display the status line
set showtabline=2               " Display tab bar all the time
set clipboard=unnamed           " Use OS clipboard
set backspace=indent,eol,start  " Backspace for dummies
set ttimeoutlen=15              " Less key code delays
set ttyfast                     " Got a fast terminal
set ttyscroll=3
set lazyredraw                  " To avoid scrolling problems
set synmaxcol=128               " Limit syntax highlighting
set pastetoggle=<F10>

set foldnestmax=10
set nofoldenable
set foldlevel=2

" Showing some whitespace chars
set list
set listchars=tab:\ \ ,trail:●

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Default to soft tabs, 2 spaces
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" tmux
inoremap <special> <Esc> <Esc>hl
if exists('$TMUX')
  set term=screen-256color
endif
" Swap iTerm2 cursors in vim insert mode
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

let mapleader = ","

map <F5> :set nowrap! <CR>

" Keep search matches in the middle of the window
nmap n nzzzv
nmap N Nzzzv
nmap * *zzzv
nmap # #zzzv
nmap g* g*zzzv
nmap g# g#zzzv

" Selecting your pasted text
nmap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Clear search highlighting
nmap <silent><Leader><Space> :noh<CR>

" Add a blank line below or above and keep the cursor in place
nmap <Leader>O m`O<Esc>``
nmap <Leader>o m`o<Esc>``

" toggle between bash and vim
nmap <Leader><C-D> :sh<CR>

nmap <Leader>j=: <Leader>wj

" Navigation - command line
cmap <C-A> <Home>
cmap <C-E> <End>

" Navigation - between windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Tab control
nmap <silent>L :tabn<CR>
nmap <silent>H :tabp<CR>
nmap <silent><C-M>L :tabm +1<CR>
nmap <silent><C-M>H :tabm -1<CR>
nmap <silent><C-T> :tabnew<CR>

" Improve F1
imap <F1> <Esc>
nmap <silent><F1> :call ToggleHelp()<CR>

fu ToggleHelp()
  if &buftype == "help"
    exec 'quit'
  else
    exec "help ".expand("<cword>")
  endif
endf
"
" Bundle
" Runtime Path Manipulation
"
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on                 " Syntax highlighting
filetype plugin indent on " Automatically detect file types

color molokai
map <C-E> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>/ <Plug>(easymotion-sn)
omap <Leader>/ <Plug>(easymotion-tn)
nmap <F8> <Plug>GitGutterNextHunk
nmap <F7> <Plug>GitGutterPrevHunk
imap <expr><CR>  pumvisible() ? "\<C-Y>" : "\<CR>"
imap <expr><C-J> pumvisible() ? "\<Down>" : "\<C-J>"
imap <expr><C-K> pumvisible() ? "\<Up>" : "\<C-K>"

nmap <Leader>c<Space> gcc
vmap <Leader>c<Space> gc
nmap <Leader>c gc
vmap <Leader>c gc
nmap <C-U> :call smooth_scroll#up(&scroll, 5, 2)<CR>
nmap <C-D> :call smooth_scroll#down(&scroll, 5, 2)<CR>
nmap <C-B> :call smooth_scroll#up(&scroll*2, 5, 4)<CR>
nmap <C-F> :call smooth_scroll#down(&scroll*2, 5, 4)<CR>

nmap <F4> :AddHeader<CR>

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

set viminfo='100,n$HOME/.vim/viminfo
set wildignore+=
  \*/tmp/*,*/.tmp/*,*/dist/*,*/coverage/*,
  \*/.idea/*,*/node_modules/*,*/platforms/*,*/.live-archive/*,
  \*.jar,*.zip,*.so,*.swp,*.class,*.map,*.swc

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|coverage)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ackhighlight = 1

let g:header_field_filename = 0
let g:header_field_author = 'Zhenkun'
let g:header_field_author_email = 'ryan.ouzhenkun@gmail.com'
let g:header_field_timestamp_format = '%Y.%m.%d'

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_enable_fuzzy_completion = 1

let g:gist_post_private = 1
let g:instant_markdown_autostart = 0
let g:gitgutter_max_signs = 10000

let g:UltiSnipsJumpForwardTrigger = '<C-F>'
let g:UltiSnipsJumpBackwardTrigger = '<C-B>'

let g:jsx_ext_required = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = ">>"
let g:syntastic_warning_symbol = ">"
let g:syntastic_stl_format = 'Syntax: %F #%t'

let g:used_javascript_libs = 'angularjs,react,flux,chai,jquery,underscore'
let javascript_enable_domhtmlcss = 1

let g:javascript_ignore_javaScriptdoc = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify']
let g:airline_theme = 'myvim'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.readonly = 'Ʀ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#branch#enabled = 0
let g:startify_session_persistence = 1 " Automatically update sessions
let g:startify_session_delete_buffers = 1
let g:startify_list_order = [
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Most recently used:'],
  \ 'files',
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ]
let g:startify_custom_header = [
  \ '                                                                   Z',
  \ '      |\/|    \  /`.|\/|                                    Z',
  \ '      |  |\/   \/  ||  |                (,.~.,.        z',
  \ '          /                             ////((\\    z',
  \ '   __________________________          ///`_  _`\ `    ___________________',
  \ '                                       ||G   \ ||      ',
  \ '   First, solve the problem.           .\|.: ~ :         .--------------.',
  \ '                                      __.| `"`.__       | \              |',
  \ '   Then, write the code.            .``   `---`   `.    |  .             :',
  \ '                                   /                `   |   `-.__________)',
  \ '   - John Johnson                 |   H A C K I N G     |  :  |          .',
  \ '                                  |    _                |     |   [ ##   :',
  \ '                                   \    `--.        ____|  ,   oo_______.`',
  \ ]

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

autocmd VimLeavePre * call CleanupHiddenBuffers()

autocmd QuickFixCmdPost *grep* cwindow

autocmd FileType * setlocal foldmethod=indent

function CleanupHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
      silent execute 'bwipeout' buf
  endfor
endfunction
