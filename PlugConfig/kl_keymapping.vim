"所有的快捷键都在这里设置,这样便于记忆和查找
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" 移动分割窗口
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" 插入模式移动光标
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-p> <Up>
inoremap <C-n> <Down>

"命令行上下左右前后移动
cnoremap <C-n> <t_kd>
cnoremap <C-p> <t_ku>
cnoremap <C-b> <S-Left>
cnoremap <C-f> <S-Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

map <F5> :call KlCompileRun()<CR>

func! KlCompileRun()
    exec "w"
    exec "AsyncRun -raw python3 % ; time"
endfunc


"""""""""""""""""""""""""""""""""""""""""
" 不同插件的快捷键设置
"""""""""""""""""""""""""""""""""""""""""
" ale插件
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap <leader>sp <Plug>(ale_previous_wrap)
nmap <leader>sn <Plug>(ale_next_wrap)
"<Leader>d查看错误或警告的详细信息
nmap <Leader>sd :ALEDetail<CR>

" airline
"tab 1~9 or buffer 1~9
function! Tab_buf_switch(num) abort
		execute 'normal '."\<Plug>AirlineSelectTab".a:num
endfunction

" 换Buffer快捷键 1 - 9
nmap <leader>1 :call Tab_buf_switch(1)<cr>
nmap <leader>2 :call Tab_buf_switch(2)<cr>
nmap <leader>3 :call Tab_buf_switch(3)<cr>
nmap <leader>4 :call Tab_buf_switch(4)<cr>
nmap <leader>5 :call Tab_buf_switch(5)<cr>
nmap <leader>6 :call Tab_buf_switch(6)<cr>
nmap <leader>7 :call Tab_buf_switch(7)<cr>
nmap <leader>8 :call Tab_buf_switch(8)<cr>
nmap <leader>9 :call Tab_buf_switch(9)<cr>

""设置切换Buffer快捷键"
" nnoremap <C-tab> :bn<CR>
" nnoremap <C-s-tab> :bp<CR>

" easymotion
"easymotion 更改快捷键
" <Leader>f{char} to move to {char}
map <Leader>f <Plug>(easymotion-overwin-f)
" Move to line
map <Leader>fl <Plug>(easymotion-overwin-line)
" Move to word
map <Leader>fw <Plug>(easymotion-overwin-w)


"vim-mulitiple-cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'






"注释掉的快捷键
" 设置 打开/关闭 Quickfix 窗口
"nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" 正常模式下 alt+j,k,h,l 调整分割窗口大小
"nnoremap <M-j> :resize +5<cr>
"nnoremap <M-k> :resize -5<cr>
"nnoremap <M-h> :vertical resize -5<cr>
"nnoremap <M-l> :vertical resize +5<cr>




"imap <C-v> "+gP
"vmap <C-c> "+y
"vnoremap <BS> d
"vnoremap <C-C> "+y
"vnoremap <C-Insert> "+y
"imap <C-V>        "+gP
"map <S-Insert>        "+gP
"cmap <C-V>        <C-R>+
"cmap <S-Insert>        <C-R>+
"
"exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
"exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
"
"" 打开当前目录 windows
"map <leader>ex :!start explorer %:p:h<CR>
"
"" 打开当前目录CMD
"map <leader>cmd :!start<cr>
"" 打印当前时间
"map <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
"
"" 复制当前文件/路径到剪贴板
"nmap ,fn :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
"nmap ,fp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
"
"" 设置切换Buffer快捷键"
"nnoremap <C-left> :bn<CR>
"nnoremap <C-right> :bp<CR>

"map <leader>tn :tabnew<cr>
"map <leader>tc :tabclose<cr>
"map <leader>th :tabp<cr>
"map <leader>tl :tabn<cr>
"nnoremap vv ^vg_
"" 转换当前行为大写
"inoremap <C-u> <esc>mzgUiw`za


