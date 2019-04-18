" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Remap a few keys for Windows behavior
source $VIMRUNTIME/mswin.vim

" Mouse behavior (the Windows way)
behave mswin

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

let g:kl_current_dir = fnamemodify(expand('<sfile>'), ':h')

" {{{
    "if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    "   set fileencodings=utf-8,ucs-bom,ucs-bom,latin1
    "endif
    set termencoding=utf-8
    "这两句一定要有
    scriptencoding utf-8
    set encoding=utf-8


" 设置不可见空白字符

    "这两句一定得要,而且前面还得设置一定,不然加载vimrc时会出错,不知道为什么
    scriptencoding utf-8
    set encoding=utf-8

    set list
    hi NonText guifg=#a0a0a0
    hi SpecialKey guifg=#a0a0a0
    set listchars=tab:»\ ,space:·,trail:·,eol:¶,nbsp:¤

    colorscheme desert
    " 解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "解决consle输出乱码
    language messages zh_CN.utf-8

    set ruler
    set showcmd                     " 在右下角 显示现有的命令
    "set guifont=Monaco:h13         " 设置字体"
    syntax on                       " 开启语法高亮"
    set nowrap                      " 设置不折行"
    set number                      " 显示行数
    set relativenumber              " 显示相对行数
    set showmatch                   " 显示匹配的括号"
    set laststatus=2                " 永远显示状态栏"
    set hlsearch                    " 高亮搜索
    set incsearch                   " 边输入边搜索
    set ignorecase                  " 搜索忽略大小写
    set smartcase                   " 智能大小写搜索
    set autoread                    " 文件在Vim之外修改过，自动重新读入
    set scrolljump=3                " 当光标离开屏幕滑动行数
    set scrolloff=1                 " 保持在光标上下最少行数
    set t_Co=256                    " 终端显示256色
    set wildmenu                    " 命令模式下补全以菜单形式显示
    set wildmode=list:longest,full  " 命令模式补全模式
    set foldenable                  " 启动折叠

    set showmode                    " 显示当前mode

    set splitright                  " 新分割窗口在右边
    set splitbelow                  " 新分割窗口在下边

    set expandtab                   " tab=空格
    set tabstop=4                   " tab缩进4个空格
    set shiftwidth=4                " 自动缩进空格数
    set softtabstop=4               " 退格删除缩进
    set backspace=indent,start      " 退格可删除缩进和原有字符
    set autoindent                  " 与前一行同样等级缩进
    set smartindent
" }}}



" 查看插件状态: PlugStatus
" 安装插件:     PlugInstall
" 更新插件:     PlugUpdate
" 清理插件:     PlugClean

" 插件管理 {{{
call plug#begin('$VIM/plugged')
" #####################################################
    Plug 'skywind3000/asyncrun.vim'         " 异步运行 神器
    Plug 'easymotion/vim-easymotion'        " 屏幕内快速跳转,有说vim-sneak更好,有时间看看
    Plug 'bling/vim-airline'                " 状态栏,很强大
    Plug 'vim-airline/vim-airline-themes'   " 状态栏主题
    Plug 'Yggdroot/indentLine'              " 缩进线
    Plug 'w0rp/ale'                         " 异步代码检查,神器


    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'

    Plug 'luochen1990/rainbow'              "彩虹括号
    Plug 'scrooloose/nerdcommenter'         "注释插件

    Plug 'junegunn/vim-easy-align'          " 指定=号对齐
    Plug 'tpope/vim-surround'               " 修改成对的括号
    Plug 'terryma/vim-multiple-cursors'     "多光标编辑,用于修改变量名
    
    Plug 'elzr/vim-json'                     "json格式语法高亮,可以高亮markdown内嵌
    Plug 'cespare/vim-toml'                  "toml格式语法高亮,可以高亮markdown内嵌
    Plug 'godlygeek/tabular'                 "必须在vim-markdown前面, 是自动排列的插件，常用于对齐=、:等
    Plug 'plasticboy/vim-markdown'           "配合tabular 写markdown文件
    
    Plug 'iamcco/mathjax-support-for-mkdp'  "需要预览数学公式时用
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }        "markdown预览,但是需要提前安装nodejs和yarn

    "下面插件应该不需要配置
    Plug 'jiangmiao/auto-pairs'             "自动补全括号
    
    "Plugin 'Raimondi/delimitMate'          "这个也是括号补全,后面再看看

    " Initialize plugin system
" #####################################################
call plug#end()
"}}} 插件管理end

"加载插件配置
let g:kl_plug_cfg_path = g:kl_current_dir.'/PlugConfig/'



execute 'source' g:kl_plug_cfg_path.'vim-easymotion.vim'
execute 'source' g:kl_plug_cfg_path.'vim-airline.vim'
execute 'source' g:kl_plug_cfg_path.'indentLine.vim'
execute 'source' g:kl_plug_cfg_path.'ale.vim'
execute 'source' g:kl_plug_cfg_path.'kl_keymapping.vim'


"quickfix window 高度
let g:asyncrun_open = 10



" ==============================================
"markdown设置


"停用預設快捷鍵設定
let g:vim_markdown_no_default_key_mappings = 1
"禁用markdown折叠
let g:vim_markdown_folding_disabled = 1
"文本强制限制单行
let g:vim_markdown_emphasis_multiline = 0
"lateX math
let g:vim_markdown_math = 1
"YAML Front
let g:vim_markdown_frontmatter = 1
"markdown 内嵌toml语法高亮
let g:vim_markdown_toml_frontmatter = 1
"markdown 内嵌json语法高亮
let g:vim_markdown_json_frontmatter = 1
"toc size自动适应
let g:vim_markdown_toc_autofit = 1

let g:indentLine_concealcursor = ''   "因为indent和markdown的有冲突,会造成markdown选中行不显示隐藏字符,这样设置就可以了


"markdown-preview.nvim配置
let g:mkdp_auto_start = 1           "进入时打开预览
let g:mkdp_refresh_slow = 1         "保存时刷新


" =================================================


" 让配置变更立即生效
autocmd! bufwritepost .vimrc source %
set pastetoggle=<F2>
"通常Vim会忽视系统剪贴板，而使用自带的剪贴板。但是有时候你想从Vim之外的程序中剪切、复制、粘贴文本。在OS X平台上，你可以通过这行代码访问你的系统剪贴板：
set clipboard=unnamed

"在粘贴时候，如果前边的行带有注释符号，如#、//、"等时，后边的行会自动加上注释符号，很是麻烦，下面可以配置不自动添加成注释。
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "no rm $"|endif|endif
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile