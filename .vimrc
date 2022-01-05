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

" git
Plug 'tpope/vim-fugitive'
Plug 'laixintao/asyncomplete-gitcommit'

"go"
Plug 'fatih/vim-go'
call plug#end()

filetype plugin on

" NERDTree
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
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsRandomiseColors = 1
let g:interestingWordsDefaultMappings = 0

" git
au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'gitcommit',
    \ 'whitelist': ['gitcommit'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#gitcommit#completor')
    \ })


" tagbar
nmap <F8> :TagbarToggle<CR>

let g:tagbar_ctags_bin = 'ctags'                       "tagbar以来ctags插件
let g:tagbar_left = 0                                          "让tagbar在页面左侧显示，默认右边
let g:tagbar_width = 30                                     "设置tagbar的宽度为30列，默认40
let g:tagbar_autofocus = 1                                "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
let g:tagbar_sort = 0                                         "设置标签不排序，默认排序
set tags+=./tags
set autochdir

" LSP
" 文件语法检查
nnoremap <C-c> :LspDocumentDiagnostics<cr>
" 找到函数定义位置
" nnoremap <C-S-d> :LspDefinition<cr>
nnoremap <C-d> :LspPeekDefinition<cr>
" 调整文档格式
nnoremap <S-f> :LspDocumentFormat<cr>

let g:lsp_signature_help_enabled = 0
let g:lsp_completion_documentation_enabled = 1
let g:lsp_completion_documentation_delay = 0
let g:lsp_document_code_action_signs_enabled = 1

"lsp-cxx
let g:lsp_cxx_hl_use_text_props = 1

" asynccomplete"
let g:asyncomplete_auto_popup=1
if &runtimepath =~ 'asyncomplete'
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
	inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
	imap <s-space> <Plug>(asyncomplete_force_refresh)
endif
let g:asyncomplete_triggers=1
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

set backspace=2
set vb t_vb=
set number
set ts=4
set cursorline
set ruler
set shiftwidth=4
set softtabstop=4
set modifiable
set autoindent
set backspace=2
set linespace=50
set nocul
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

map spl :set splitright<CR>:vsplit<CR>
map sph :set nosplitright<CR>:vsplit<CR>
map spj :set splitbelow<CR>:split<CR>
map spk :set nosplitbelow<CR>:split<CR>

" 修改匹配括号的颜色
hi MatchParen ctermbg=blue guibg=white
" 光标下单词高亮设定
hi CursorColumn term=reverse ctermbg=brown ctermfg=black  guibg=white
hi CursorLine term=NONE cterm=bold ctermbg=240
highlight TabLineSel term=bold cterm=bold ctermbg=red ctermfg=gray
" 注释颜色设定
highlight Comment cterm=NONE ctermfg=blue guifg=white
" 窗口状态栏颜色设定
highlight StatusLineTerm term=bold,reverse cterm=bold ctermfg=15 ctermbg=200 gui=bold guifg=bg guibg=DarkGreen
" 窗口状态栏（非当前窗口）颜色设定
highlight StatusLineTermNC term=reverse ctermfg=15 ctermbg=200 guifg=bg guibg=DarkGreen
" crtl + v 选中颜色设定
highlight Visual term=reverse ctermbg=240 guibg=LightGrey
" 多余空格颜色
highlight goSpaceError ctermfg=black ctermbg=black
" search , 例如在文件语法检测中，跳转到选中行时的颜色
highlight Search term=reverse ctermbg=245 guibg=Yellow
