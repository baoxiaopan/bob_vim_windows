set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" 设置编码(Windows下如果不确定系统编码最好取消以下设置，以免导致乱码)
" set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8

" 设置gvim启动窗口的位置，以及大小
winpos 100 50
set lines=35 columns=100

" 为光标所在行添加标识(Windows下为高亮模式，Linux下为下划线)
setlocal cursorline
hi CursorLine   cterm=underline ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nocp
filetype plugin on
set history=20
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set nobackup
set shiftwidth=4
set cinoptions=(0,:0
set expandtab
set uc=0        "do not use swap file when editing
set nu

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" 设置gvim的字体和大小，以及配色方案
set guifont=Lucida_Console:h12:cANSI
" colorscheme freya
" colorscheme lucius
" colorscheme blackdust
colorscheme baycomb

if has("autocmd")
  filetype plugin indent on
  autocmd FileType text setlocal tabstop=4
  autocmd FileType py setlocal tabstop=4
  autocmd FileType sh setlocal tabstop=4
  autocmd FileType text setlocal textwidth=78
  autocmd FileType html setlocal shiftwidth=2
  autocmd FileType xml setlocal shiftwidth=2
else
  set autoindent                " always set autoindenting on
endif

execute pathogen#infect()

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"added for vimExplorer
"C-Tab for switching the files
let g:VEConf_treeHotkey = {}
let g:VEConf_treeHotkey.toggleNode = 'o'
let g:VEConf_treeHotkey.switchPanel = '<s-tab>'
let g:VEConf_fileHotkey = {}
let g:VEConf_fileHotkey.switchPanel = '<s-tab>'

nmap <C-TAB> <C-PageDown>
nmap <C-S-TAB> <C-PageUp>

"NERD Tree
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
nnoremap f :NERDTreeToggle
