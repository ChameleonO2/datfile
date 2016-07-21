set noswapfile
set smartindent
set number
set clipboard=unnamed,unnamedplus
set cursorline
set laststatus=2
set statusline=2
set showcmd
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set tabstop=4
set backspace=indent,eol,start
set smarttab
set mouse=a
if exists('&ambiwidth')
	set ambiwidth=double
endif

"keybind
inoremap <C-j><C-j> <ESC>A
inoremap <C-j>; <ESC>A;<ESC>
inoremap <C-j>j <ESC>



" neobundle settings {{{
if has('vim_starting')
set nocompatible
if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
echo "install neobundle..."
:call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
endif
"
" runtimepath add 
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Shougo/neomru.vim', {
  \ 'depends' : 'Shougo/unite.vim'
  \ }
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundleLazy 'Shougo/vimfiler', {
  \ 'depends' : ["Shougo/unite.vim"],
  \ 'autoload' : {
  \   'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer", "VimFilerBufferDir" ],
  \   'mappings' : ['<Plug>(vimfiler_switch)'],
  \   'explorer' : 1,
  \ }}
NeoBundle 'TwitVim' 
"javatest

NeoBundleLazy 'vim-scripts/javacomplete',{
\	'build':{
\	'cygwim': 'javac autoload/Reflection.java',
\	'mac': 'javac autoload/Reflection.java',
\	'unix': 'javac autoload/Reflection.java',
\},
\}
NeoBundle 'Shogo/unite.vim'
 "unite {{{
 let g:unite_enable_start_insert=1
 nmap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
 nmap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
 nmap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
 nmap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
 nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru<CR>
 nmap <silent> <C-u><C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
 au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
 au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
 au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
 au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
 au FileType unite nmap <silent> <buffer> <ESC><ESC> q
 au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q
 " }}}

NeoBundle 'Shougo/neomru.vim',{
	\'depends' : 'shogo/unite.vim'
	\}
NeoBundle 'tomtom/tcomment_vim'


"20150709
NeoBundle 'Shougo/neosnippet'

"自動文法チェック
NeoBundle "scrooloose/syntastic"
if ! empty(neobundle#get("syntastic"))
	" Disable automatic check at file open/close
	let g:syntastic_check_on_open=0
	let g:syntastic_check_on_wq=0
	"       " C
	let g:syntastic_c_check_header = 0
	"           " C++
	let g:syntastic_cpp_check_header = 0
	"               " Java
	let g:syntastic_java_javac_config_file_enabled = 1
	let g:syntastic_java_javac_config_file ="$HOME/.syntastic_javac_config"
endif
	  

NeoBundleLazy 'Shougo/vimshell', {
  \ 'depends' : 'Shougo/vimproc',
  \ 'autoload' : {
  \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
  \                 'VimShellExecute', 'VimShellInteractive',
  \                 'VimShellTerminal', 'VimShellPop'],
  \   'mappings' : ['<Plug>(vimshell_switch)']
  \ }}


" Install vim-clang
 NeoBundle 'justmao945/vim-clang'

 " set clang options for vim-clang
 let g:clang_c_options = '-std=c99'
 let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'

"  eskk
"  NeoBundleLazy 'tyru/eskk'
" let g:eskk#directory = "~/.eskk"
" let g:eskk#dictionary = { 'path': "~/.skk-jisyo", 'sorted': 0, 'encoding': 'utf-8', }
" let g:eskk#large_dictionary = { 'path': "~/.eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp', }


"候補の自動表示

" if !exists('g:neocomplete#force_omni_input_patterns')
" 	    let g:neocomplete#force_omni_input_patterns = {}
"    endif
"    let g:neocomplete#force_omni_input_patterns.cpp =
"            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'




" vimshell {{{
 nmap <silent> vs :<C-u>VimShell<CR>
 nmap <silent> vp :<C-u>VimShellPop<CR>
" }}}



""""""""

"とりあえずテスト
" if has('lua')
" 	  NeoBundleLazy 'Shougo/neocomplete.vim', {
" 	      \ 'depends' : 'Shougo/vimproc',
" 	      \ 'autoload' : { 'insert' : 1,}
" 	      \ }
"   endif
	  NeoBundle 'Shougo/neocomplete.vim', 

  " neocomplete {{{
  let g:neocomplete#enable_at_startup               = 1
  let g:neocomplete#auto_completion_start_length    = 1
   let g:neocomplete#enable_ignore_case              = 1
   let g:neocomplete#enable_smart_case               = 1
   let g:neocomplete#enable_camel_case               = 1
   let g:neocomplete#use_vimproc                     = 1
   let g:neocomplete#sources#buffer#cache_limit_size = 1000000
   let g:neocomplete#sources#tags#cache_limit_size   = 30000000
   let g:neocomplete#enable_fuzzy_completion         = 1
   let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
   " }}}
   
" vimfiler {{{
 let g:vimfiler_as_default_explorer  = 1
 let g:vimfiler_safe_mode_by_default = 0
 let g:vimfiler_data_directory       = expand('~/.vim/etc/vimfiler')
 nnoremap <silent><C-u><C-j> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit -toggle<CR>
" }}}
"""twitvim{{{
let twitvim_force_ssl = 1 
let twitvim_count = 40
""""}}}
""javahogehoge
"NeoBundle  'moznion/jcommenter'



" ""hogehogeneocomplcache
" NeoBundle 'Shougo/neocomplcache'
" " Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" " Use neocomplcache.
" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
" " Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
"     \ 'default' : ''
"     \ }
"
" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplcache#smart_close_popup() . "\<CR>"
" endfunction
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
"easymotion

NeoBundle 'Lokaltog/vim-easymotion'
" vim-easymotion {{{
 let g:EasyMotion_do_mapping = 0
 nmap s <Plug>(easymotion-s2)
 xmap s <Plug>(easymotion-s2)
 omap z <Plug>(easymotion-s2)
 nmap g/ <Plug>(easymotion-sn)
 xmap g/ <Plug>(easymotion-sn)
 omap g/ <Plug>(easymotion-tn)
 let g:EasyMotion_smartcase = 1
 map <Leader>j <Plug>(easymotion-j)
 map <Leader>k <Plug>(easymotion-k)
 let g:EasyMotion_startofline = 0
 let g:EasyMotion_keys = 'QZASDFGHJKL;'
 let g:EasyMotion_use_upper = 1
 let g:EasyMotion_enter_jump_first = 1
 let g:EasyMotion_space_jump_first = 1
 hi EasyMotionTarget guifg=#80a0ff ctermfg=81
 " }}}
 " 
 " lichtline
NeoBundle 'itchyny/lightline.vim'

 "twitter
" NeoBundle 'basyura/TweetVim'
" NeoBundle 'mattn/webapi-vim'
" NeoBundle 'basyura/twibill.vim'
" NeoBundle 'tyru/open-browser.vim'
" NeoBundle 'h1mesuke/unite-outline'
" NeoBundle 'basyura/bitly.vim'

"NeoBundleLazy 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
	""""""""""""""""""""""""""""""
	" 自動的に閉じ括弧を入力
	""""""""""""""""""""""""""""""
	"	imap { {}<LEFT>
	"	imap [ []<LEFT>
	"	imap ( ()<LEFT>
	""""""""""""""""""""""""""""""

" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
	NeoBundleCheck
call neobundle#end()

	filetype plugin indent on
	set t_Co=256
	syntax on
	colorscheme jellybeans

nmap <C-k>f :VimFiler -split -simple -winwidth=35 -no-quit


