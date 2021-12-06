call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'majutsushi/tagbar'

"LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()


nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"vim-interestingwords
nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
vnoremap <silent> <leader>k :call InterestingWords('v')<cr>
nnoremap <silent> <leader>K :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>
"must add export TERM=xterm-256color in ~/.bashrc
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsGUIColors = ['#000000', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']

" tagbar
nmap <F8> :TagbarToggle<CR>

" tagbar
let g:tagbar_ctags_bin = 'ctags'                       "tagbar以来ctags插件
let g:tagbar_left = 0                                          "让tagbar在页面左侧显示，默认右边
let g:tagbar_width = 30                                     "设置tagbar的宽度为30列，默认40
let g:tagbar_autofocus = 1                                "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
let g:tagbar_sort = 0                                         "设置标签不排序，默认排序
set tags=tags
set autochdir


"lsp-cxx
let g:lsp_cxx_hl_use_text_props = 1


"easy
"let g:easycomplete_tab_trigger="<c-space>"
"let g:easycomplete_scheme="sharp"

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

set backspace=2
set vb t_vb=
set number
set ts=4
set cursorline
hi CursorLine ctermbg = gray
set ruler
set shiftwidth=4
set softtabstop=4
set modifiable

map spl :set splitright<CR>:vsplit<CR>
map sph :set nosplitright<CR>:vsplit<CR>
map spj :set splitbelow<CR>:split<CR>
map spk :set nosplitbelow<CR>:split<CR>

" 修改匹配括号的颜色
MatchParen ctermbg=blue guibg=white
" 光标下单词高亮设定
hi CursorColumn term=reverse ctermbg=brown guibg=white

