"开启真彩色支持
set termguicolors
"开启256色支持
set t_Co=256

let mapleader = ","
" 快捷退出插入模式
inoremap jk <Esc>`^

" 设置通用选项
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 不与vi兼容
set nocompatible

set encoding=utf-8

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch
" 增量搜索
set incsearch

" 显示当前键入的字符
set showcmd
" 不显示当前模式(已经有插件帮我们做了)
set noshowmode
" 底部命令模式进行命令补全时，在上方开启候选菜单，Ctrl-N/Ctrl-P移动选项
set wildmenu
set wildmode=list:longest

" 智能检测是否需要忽略大小写
" 如果字符串中全部是小写，开启忽略大小写
" 如果字符串中有一个以上大型，不忽略大小写
set ignorecase
set smartcase

" 使用正常的正则表达式，而不是vim中特殊的
nnoremap / /\v
vnoremap / /\v

" 代码缩进
" 自适应不同语言的智能缩进
filetype plugin indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 开启新行时 (插入模式下输入 <CR>，或者使用 "o" 或 "O" 命令)，从当前行复
" 制缩进距离。如果你在新行除了 <BS> 或 CTRL-D 以外不输入任何东西，然后输
" 入 <Esc>、CTRL-O 或 <CR>，缩进又被删除。移动光标到其它行也有同样的效果
set autoindent
" 针对C语言的语法在某些情况下智能缩进，如在{后换行增加缩进
set smartindent
" 设置折叠方式
set foldmethod=indent


" 自定义配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 快捷保存
inoremap <leader>w <Esc>:w<CR>
nnoremap <leader>w :w<CR>

" 方便修改vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" 窗口移动更方便
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" 窗口失去聚焦时自动保存文件
autocmd FocusLost * :wa

" 安装插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')

Plug 'vim-airline/vim-airline' " statusline 美化插件

Plug 'scrooloose/nerdcommenter' "多种注释风格插件

Plug 'Yggdroot/indentLine'  "缩进可视化
" :IndentLinesToggle 可以开启或关闭缩进标记

Plug 'vimcn/vimcdoc'  "vim手册中文文档
Plug 'flazz/vim-colorschemes'

" 配色方案
""""""""""""""""""""""""""""""""""""""
set background=dark
" colorscheme solarized
" colorscheme candy
colorscheme Monokai
" colorscheme SweetCandy
" colorscheme jellybeans
" colorscheme vibrantink
" colorscheme molokai

" 快速加入修改环绕字符
" for repeat -> enhance surround.vim, . to repeat command
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'

" 自动补全单引号，双引号等
Plug 'Raimondi/delimitMate'

" 文本对象插件
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow_parentheses
" 括号显示增强
Plug 'kien/rainbow_parentheses.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rbpt_colorpairs = [
	\ ['brown',       'RoyalBlue3'],
	\ ['Darkblue',    'SeaGreen3'],
	\ ['darkgray',    'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['brown',       'firebrick3'],
	\ ['gray',        'RoyalBlue3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['darkred',     'DarkOrchid3'],
	\ ['red',         'firebrick3'],
	\ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'python-mode/python-mode', { 'for': 'python' }
" python-mode配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"开启警告
let g:pymode_warnings = 0
"保存文件时自动删除无用空格
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
"设置QuickFix窗口的最大，最小高度
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 1
"使用python3
let g:pymode_python = 'python3'
"开启python-mode定义的移动方式
let g:pymode_motion = 1
"使用python-mode运行python代码
let g:pymode_run_bind = '<Leader>r'
"使用python-mode设置断点
let g:pymode_breakpoint_bind = '<leader>b'
"开启python所有的语法高亮
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree' "浏览目录树插件
" NERDTree 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDTreeAutoCenter = 1    "距离底部一定距离时居中屏幕
let NERDTreeAutoCenterThreshold = 5
"这个选项只会对树导航映射作出反应，
"即： |NERDTree-J| |NERDTree-K| |NERDTree-C-J| |NERDTree-C-K| |NERDTree-p|
let NERDTreeShowBookmarks = 1 "显示书签表
let NERDTreeShowHidden = 1    "显示隐藏文件
let NERDTreeWinPos = 'left'   "显示位置

" 打开目录时自动打开NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" 快捷打开NERDTree
command! -nargs=* -complete=file NT NERDTree <args>
map <leader>t :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ludovicchabant/vim-gutentags' "自动生成tags
" Ctags与vim-gutentags配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 在打开文件的目录以及当前所在目录中搜索tags
set tags=./.tags;,.tags

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 代码补全""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Valloric/YouCompleteMe'
" YouCompleteMe配置
"'''''''''''''''''''''''''''''''''''''''''''''"""""""""""""""""""""""""""""'

" 全局conf文件地址
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" 取消载入conf文件时出现确认提示
let g:ycm_confirm_extra_conf = 0
" 取消花边功能
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
" 输入两个字符后进行内容补全提示
let g:ycm_min_num_identifier_candidate_chars = 2
" 输入两个字符后根据语言语义补全
let g:ycm_semantic_triggers =  {
    \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
    \ 'cs,lua,javascript': ['re!\w{2}'],
    \ }
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings=1
" 主动补全
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
" 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" 弹出列表时选择前1项的快捷键(默认为<S-TAB>和<UP>)
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" 停止显示补全列表(防止列表影响视野), 可以按<C-Space>重新弹出
let g:ycm_key_list_stop_completion = ['<C-y>']
" 文件白名单
let g:ycm_filetype_whitelist = { 
        \ "c":1,
        \ "cpp":1, 
        \ "python":1, 
        \ "sh":1,
        \ "zsh":1,
    \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" LeaderF 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 文件搜索快捷命令
let g:Lf_ShortcutF = '<leader>ff'
" buffer搜索快捷命令
let g:Lf_ShortcutB = '<leader>fb'
noremap <leader>fn :LeaderfFunction!<CR>
noremap <leader>fm :LeaderfMru<CR>
noremap <leader>ft :LeaderfTag<CR>
noremap <leader>fl :LeaderfLine<CR>
" 搜索结果窗口高度为1/3
let g:Lf_WindowHeight = 0.30
" 不显示相近的文件路径
let g:Lf_ShowRelativePath = 0
let g:Lf_CacheDirectory = expand('~/.cache/leaderf')
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_HideHelp = 1
" 取消预览结果
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0}
" 设置Lf工作目录
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'


" 代码片段插件ultisnips
" 插件的引擎.
Plug 'SirVer/ultisnips'
" 代码片段集合 
Plug 'honza/vim-snippets'

" Ultisnips 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<leader><Tab>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" move quickly
" easy motion config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'easymotion/vim-easymotion'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 修改easymotion动作前缀
map <leader>m <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
" 避免重复使用hjkl
map <Leader>ml <Plug>(easymotion-lineforward)
map <Leader>mj <Plug>(easymotion-j)
map <Leader>mk <Plug>(easymotion-k)
map <Leader>mh <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0

call plug#end()



