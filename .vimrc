set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdtree'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Blackrush/vim-gocode'
" Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required
"
syntax enable
syntax on
"set t_Co=256
color darkblue
"color default
set number
"set bg&
set cursorline
set ruler
set nobackup
"set autochdir
filetype indent on
filetype plugin on
filetype plugin indent on
set incsearch
set hlsearch
set showmatch
set smartindent
set foldenable
set foldmethod=syntax
set foldlevelstart=99
"set fileencodings=utf-8
set tabstop=4
set shiftwidth=4
"set expandtab
" set updatetime=1000
set completeopt=longest,menu
set autoread
"set mouse=a "启动鼠标

"超过80个字符就用下划线标出
"au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml 2match Underlined /.\%81v/

au BufReadPost * if line("'\"") >0 | if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"map <F4> :call CallTaglistOrBar()<CR>
"function! CallTaglistOrBar()
"    if &filetype != 'go'
"		let Tlist_Ctags_Cmd='/usr/bin/ctags'                 "     基于ctags
"		let Tlist_Auto_Open = 0                     "     默认打开Taglist
"		let Tlist_Sort_Type = "name"                "     按照名称排序
"		let Tlist_Show_One_File=1                   "     不同时显示多个文件的tag,只显示当前文件的
"		let Tlist_Use_Right_Window = 0              "     在右侧显示窗口
"		let Tlist_Compart_Format = 1                "     不显示空白行
"		let Tlist_Exist_OnlyWindow = 1              "     如果只有一个buffer,kill窗口也kill掉buffer
"		let Tlist_File_Fold_Auto_Close = 1          "     打开其他文件的时候自动关闭,只显示一个文件的tag
"		let Tlist_Exit_OnlyWindow=1
"		let Tlist_Auto_Update=1                     "     自动更新,包含新文件时候
"		let Tlist_Enable_Fold_Column = 0            "     不要显示折叠树
"		let Tlist_Use_Right_Window=1                "     右边显示 Left_Window 会左边显示
"		let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'
"		map <F4>:TlistToggle<CR>
"		nnoremap <silent><F5> :TlistHighlightTag<CR>
"	else
"		let g:tagbar_ctags_bin='/usr/bin/ctags'
"		let g:tagbar_width=30
"		autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()　" 在某些情况下自动打开tagbar
"		map <F4> :TagbarToggle<CR>
"		nnoremap <silent><F5> :TagbarHighlight<CR>
"	endif
"endfunction
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()　" 在某些情况下自动打开tagbar
map <F4> :TagbarToggle<CR>
"nnoremap <silent><F5> :TagbarHighlight<CR>
let NERDShutUp = 1
nmap <F12> :!ctags -R --c++-kinds=+p --fields=+ias --extra=+q<CR>
imap <F12> <Esc>:w<CR><F12>
"setcscopequickfix=s-,c-,d-,i-,t-,e-
"输入{会自动生成一对
"imap { {}<ESC>i<CR><ESC>V<O
"输入(会自动生成一对
imap ( ()<ESC>i
"输入[会自动生成一对[]
imap [ []<ESC>i
"bash文件快捷方式帮助文件
nmap bh :vsp ~/.vim/doc/bashsupport.txt <CR>635G
nmap qbh :q!<CR>

"c文件快捷方式帮助文件
nmap ch :vsp ~/.vim/c-support/doc/c-hotkeys.tex <CR>191G

let g:winManagerWidth = 30
nmap <silent> <F3> :NERDTreeToggle<CR>
nmap <F6>b :VCSBlame<CR>
nmap <F6>d :VCSDiff<CR>
nmap <F6>l :VCSLog<CR>
nmap <F6>vd :VCSVimDiff<CR>
"查看commit下的修改文件
nmap <F6>lf :VCSLog  -p --name-only<CR>  

"let g:winManagerWindowLayout='FileExplorer|BufExplorer'
let g:persistentBehaviour=0
let g:defaultExplorer=1

if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif

nmap <F2>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <F2>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <F2>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <F2>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F2>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <F2>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <F2>i :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <F2>f :cs find f <C-R>=expand("<cword>")<CR><CR>

"doxygen toolkit
let g:DoxygenToolkit_briefTag_pre="Function:  "
let g:DoxygenToolkit_paramTag_pre="Input:  "
let g:DoxygenToolkit_returnTag="Return:   "
let g:DoxygenToolkit_blockHeader="-----------------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="------------------------------------------------------------------------------------------"

let g:DoxygenToolkit_authorName="Drunkedcat"
let g:DoxygenToolkit_licenseTag="GPL 2.0"

let g:DoxygenToolkit_authorName="drunkedcat, whitelilis@gmail.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
 autocmd BufNewFile *.[ch],*.hpp,*.cpp exec ":call SetTitle()"

 "加入注释
 func SetComment()
     call setline(1,"/*===============================================================")
     call append(line("."),   "*   Copyright (C) ".strftime("%Y")." All rights reserved.")
     call append(line(".")+1, "*   ")
     call append(line(".")+2, "*     File name：".expand("%:t"))
     call append(line(".")+3, "*        Author: qcli")
     call append(line(".")+4, "*       Created：".strftime("%Y-%m-%d"))
     call append(line(".")+5, "*   Description：")
     call append(line(".")+6, "*")
     call append(line(".")+7, "*    Update log：")
     call append(line(".")+8, "*")
     call append(line(".")+9, "================================================================*/")
 endfunc

 "定义函数SetTitle，自动插入文件头
 func SetTitle()
     call SetComment()
     if expand("%:e") == 'hpp'
  call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H")
  call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H")
  call append(line(".")+12, "#ifdef __cplusplus")
  call append(line(".")+13, "extern \"C\"")
  call append(line(".")+14, "{")
  call append(line(".")+15, "#endif")
  call append(line(".")+16, "")
  call append(line(".")+17, "#ifdef __cplusplus")
  call append(line(".")+18, "}")
  call append(line(".")+19, "#endif")
  call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H")
     elseif expand("%:e") == 'h'
  call append(line(".")+10, "#pragma once")
     elseif &filetype == 'c'
  call append(line(".")+10,"#include \"".expand("%:t:r").".h\"")
     elseif &filetype == 'cpp'
  call append(line(".")+10, "#include \"".expand("%:t:r").".h\"")
     endif
 endfunc

"Plugin 'fatih/vim-go'

"python 自动加入头部注释
function HeaderPython()
	call setline(1, "#!/usr/bin/env python")
	call setline(2, "#-*- coding:utf8 -*-")
	call setline(3, "")
	call setline(4, "#================================================================")
	call setline(5, "#   Copyright (C) ".strftime("%Y")." All rights reserved.")
	call setline(6, "#   ")
	call setline(7, "#      FileName: ".expand("%:t"))
	call setline(8, "#        Author: qcli")
	call setline(9, "#       Created: ".strftime("%Y-%m-%d"))
	call setline(10, "#   Description: ")
	call setline(11, "#")
	call setline(12, "#   UpdateLog: ")
	call setline(13, "#")
	call setline(14, "#================================================================")
	call setline(15, "")
	normal G
	normal o
	normal o
endf
autocmd bufnewfile *.py call HeaderPython()

"emmet Emmet的基本用法：先写简写形式，然后用"<Ctrl+y>,"将其转成HTML代码
"#####基本规则:
"1. E 代表HTML标签
"2. E#id 代表标签E有id属性
"3. E.class 代表E有class属性
"4. E[attr=foo] 代表某个特定属性
"5. E{info} 代表标签E包含的内容是info
"6. E>N 代表N是E的子元素
"7. E+N 代表N是E的同级元素
"8. E^N 代表N是E的上级元素

let g:user_emmet_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}

"airline
set ambiwidth=double

"ctrlp
"<ctrl-p> start 
"<ctrl-r> to switch to regexp mode.
"<c-f> and <c-b> to cycle between modes(buffer, file, mru).
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|o|a)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files = 0

" ycm 
"let g:ycm_key_list_select_completion = ['<C-n>', '<space>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"multiple cursors
" Default mapping
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'

"==============================================================================
"" vim-go 插件
"==============================================================================
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:godef_split=2

"vim-gocode 
imap <F7> <C-x><C-o>

"run python
nmap <F5>r :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
	let mp = &makeprg
	let ef = &errorformat
	let exeFile = expand("%:t")
	setlocal makeprg=python\ -u
	set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
	silent make %
	copen
	let &makeprg = mp
	let &errorformat = ef
endfunction


let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
