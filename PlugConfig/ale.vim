
"自定义error和warning图标
let g:ale_sign_error = 'XX'
let g:ale_sign_warning = '!!'


"改变命令行消息, 出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


"改变状态栏信息格式
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" show errors or warnings in my statusline
"let g:airline#extensions#ale#enabled = 1


" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0                  "打开文件时不进行检查



"对于Java如果安装在中文的系统上，错误和警告信息都会乱码，可以进行下面的设置
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'

"let g:ale_sign_column_always = 1
"let g:ale_set_highlights = 0

"指定某种语言特定的Linter,比如对于C/C++我都是使用clang,那么就可以像下面这样配置
"let g:ale_lintetrs = {
"      \'c++': ['clang'],
"      \'c': ['clang'],
"      \'python': ['pylint'],
"      \ 'go': ['golint', 'go vet', 'go build'],
"      \'javascript': ['eslint', 'stylelint'],
"      \'jsx': ['eslint', 'stylelint'],
"      \'less': ['prettier'],
"      \ }

