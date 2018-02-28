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
" Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required
"
syntax enable
syntax on
"set t_Co=256
"color darkblue
color default
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
"set foldenable
"set foldmethod=syntax
"set fileencodings=utf-8
set tabstop=4
set shiftwidth=4
set noexpandtab
" set updatetime=1000
set completeopt=longest,menu
set autoread
"set mouse=a "启动鼠标

"超过80个字符就用下划线标出
"au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml 2match Underlined /.\%81v/

au BufReadPost * if line("'\"") >0 | if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

let Tlist_Ctags_Cmd='/usr/bin/ctags'
"set tag+=tags;
set tags=./tags,tags;
"set autochdir
nnoremap <silent><F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Auto_Update = 1
let Tlist_Auto_Highlight_Tag = 0
let Tlist_Highlight_Tag_On_BufEnter = 0
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Compact_Format = 1
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

nnoremap <silent><F3> :WMToggle<CR>
nnoremap <silent><F5> :TlistHighlightTag<CR>
nmap <F6>b :VCSBlame<CR>
nmap <F6>d :VCSDiff<CR>
nmap <F6>l :VCSLog<CR>
nmap <F6>vd :VCSVimDiff<CR>

let g:winManagerWindowLayout='FileExplorer|BufExplorer'
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

"set cscopequickfix=s-,c-,d-,i-,t-,e-

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
