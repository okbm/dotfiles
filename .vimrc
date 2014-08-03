set nocompatible
filetype off

"filetype plugin on
filetype indent on

" neoBundle
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'vim-scripts/The-NERD-tree'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'Shougo/Vimfiler'
NeoBundle 'mattn/benchvimrc-vim'
NeoBundle 'yuroyoro/smooth_scroll.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Lokaltog/vim-powerline'
" NeoBundle 'plasticboy/vim-markdown'

"色の設定
"syntax on
"hi Search term=reverse ctermfg=black
"hi Pmenu ctermfg=black
"hi PmenuSel ctermfg=black

" item2用
" download https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set term=screen-256color


"行番号の表示/非表示
set nu
set cursorline

" 自動インデント
set autoindent

" タブ入力がスペース
set shiftwidth=4
set softtabstop=4
set tabstop=4

"ステータスバー関係
set ruler
set title
set laststatus=2

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch

" 改行コードやタブの表示設定
set list
"set listchars=tab:>.,trail:-,nbsp:%
set listchars=tab:>-,trail:-,nbsp:-,extends:>,precedes:<,

" スクロールするときに画面の一番上にいかなくていい
set scrolloff=10

" インクリメンタルサーチを有効に
set incsearch

" 改行コードを付けない
"set binary noeol

"検索にハイライト
set hlsearch

"Escの2回押しでハイライト消去
nmap <Esc><Esc> :nohlsearch<CR>

"検索時に大文字小文字を分類しない
set ignorecase

"検索をファイルの先頭へループしない
set nowrapscan

"括弧のハイライトを消す"
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>
"
hi Search guibg=Yellow ctermbg=Yellow

" スクロール高速
set lazyredraw

"vimrcの読み込み
:command! Vimrc :e ~/.vimrc

"保存時にphp構文チェック
autocmd BufWritePost *.php !php -l %

" カーソルを行頭、行末でとまらないようにする
"set whichwrap=b,s,h,l,<,>,[,]

" 文字コード関連
" UTF-8 対応
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,sjis,ucs-2le,ucs2

" swap等のファイルを作らない
set nowritebackup
set nobackup
set noswapfile

set textwidth=0          " 自動的に改行が入るのを無効化
"set colorcolumn=80      " その代わり80文字目にラインを入れる

" pasteするときにキレイにする
set pastetoggle=<C-E>

" ファイル名の補完
set wildmode=list:longest
"-------------------------------------------
" キーバインド変更
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

"タグジャンプのボタンをCtrl + Bで飛ぶ
"nnoremap <C-t> : <C-]>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n','g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

"バッファ操作
nnoremap <C-m><C-n> :bn<CR>
nnoremap <C-m><C-p> :bp<CR>

" 空行を挿入する
" http://vim-users.jp/2009/08/hack57/
 nnoremap 0 :<C-u>call append(expand('.'), '')<Cr>j

" 全角文字にしたときに赤くする
 if has('multi_byte_ime') || has('xim') 
     highlight Cursor guifg=NONE guibg=White
     highlight CursorIM guifg=NONE guibg=DarkRed
 endif

" クリップボードにコピー
set clipboard=unnamed,autoselect
"-------------------------------------------
" pluginの設定 " 
" neocomplcache

" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ctagsの設定
au BufNewFile,BufRead *.php set tags+=$HOME/php.tags
au BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/php.tags `pwd` 2>/dev/null &"
" 複数の候補が出た場合に表示させる
nnoremap <C-]> g<C-]>

" HTMLの</で閉じタグを入れる
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>

" unite.vim
" 入力モードで開始
let g:unite_enable_start_insert=0
" バッファ一覧
nnoremap <silent> ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ua :<C-u>UniteWithBufferDir -buffer-name=files bufferfile_mru bookmark file<CR>

" grep
nnoremap <silent> ug :<C-u>Unite grep::-iHRn -direction=botright <CR>

"browserload-mac
" リロード後に戻ってくるアプリ 変更してください
let g:returnApp = "iTerm"
nmap <Space>bc :ChromeReloadStart<CR>
nmap <Space>bC :ChromeReloadStop<CR>
nmap <Space>bf :FirefoxReloadStart<CR>
nmap <Space>bF :FirefoxReloadStop<CR>
nmap <Space>bs :SafariReloadStart<CR>
nmap <Space>bS :SafariReloadStop<CR>
nmap <Space>bo :OperaReloadStart<CR>
nmap <Space>bO :OperaReloadStop<CR>
nmap <Space>ba :AllBrowserReloadStart<CR>
nmap <Space>bA :AllBrowserReloadStop<CR>

"-------------------------------------------
set expandtab
autocmd BufNewFile,BufRead *.yml set shiftwidth=2
autocmd BufNewFile,BufRead *.yml set softtabstop=2
autocmd BufNewFile,BufRead *.yml set tabstop=2

autocmd BufNewFile,BufRead *.php set shiftwidth=4
autocmd BufNewFile,BufRead *.php set softtabstop=4
autocmd BufNewFile,BufRead *.php set tabstop=4

autocmd BufNewFile,BufRead *.json set shiftwidth=2
autocmd BufNewFile,BufRead *.json set softtabstop=2
autocmd BufNewFile,BufRead *.json set tabstop=2
"----------------------------------------------------------+
"  ステータスライン                                        |
"----------------------------------------------------------+

" ステータスラインを常に表示,色変更
set laststatus=2
hi StatusLine ctermfg=White ctermbg=Blue cterm=none
au InsertEnter * hi StatusLine ctermfg=Black ctermbg=yellow cterm=none
au InsertLeave * hi StatusLine ctermfg=White ctermbg=Blue cterm=none

autocmd BufEnter,BufWritePost * call ErrorCheckStatusline()

" エラー時のステータスライン変更用関数
function! ErrorCheckStatusline()

  " エラー時の色定義
  let l:ecol = 'highlight StatusLine ctermfg=Yellow ctermbg=Red cterm=none'
  "
  if ! exists('g:is_error')
      " 通常時の色定義
      let s:fg = synIDattr( hlID( "StatusLine" ) , "fg" )
      let s:bg = synIDattr( hlID( "StatusLine" ) , "bg" )
      let g:ncol = 'highlight StatusLine ctermfg='.s:fg.' ctermbg='.s:bg.' cterm=none'
  endif

  " チェックを実行(PHP)
  if &filetype == "php"
    let l:tmp = system("php -l ".bufname(""))

    " エラーがあった場合
    if ! (l:tmp =~ "No syntax errors" )
       let g:is_error = 1
       "let g:status = split(l:tmp, '\n')
       let g:status = split(l:tmp, ' in ')
       "silent exec 'set statusline=%{g:status[0]}%=%c,%l%11p%%'
       "silent exec l:ecol
       return
    else
       let g:is_error = 0
    endif


  " チェックを実行(python)
  elseif &filetype == "python"
    let l:tmp = system("pyflakes ".bufname(""))

    " エラーがあった場合
    if ! (l:tmp == "" )
       let g:is_error = 1
       let g:status = split(l:tmp, '\n')
       silent exec 'set statusline=%{g:status[0]}%=%c,%l%11p%%'
       silent exec l:ecol
       return
    else
       let g:is_error = 0
    endif

  endif

  " 通常のステータスラインを表示
  "silent exec 'set statusline=%F,\ \ %{GetFunctionName()}%=%l/%L%11p%%'
  "silent exec g:ncol
  return
endfunction

"----------------------------------------------------------+
"  Program                                                 |
"----------------------------------------------------------+

" PHP
autocmd BufNewFile,BufRead *.ctp set filetype=php
autocmd BufNewFile,BufRead *.yml.gree set filetype=yaml
autocmd BufNewFile,BufRead *.yml..mixi set filetype=yaml

" Python
let python_highlight_all = 1
autocmd FileType python set omnifunc=pythoncomplete
autocmd FileType python set omnifunc=pysmell

" javascript
autocmd filetype coffee,javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab

" funtion名取得関数
function! GetProgramDefineFunc()
    let s:ext  = expand('%:e')
    if s:ext == "php"
        return "function"
    elseif &filetype == "vim"
        return "function!"
    elseif &filetype == "py"
        return "def"
    else
        return ""
    endif
endfunction

" function行の取得用の関数
function! GetFunc()
    let s:func = GetProgramDefineFunc()
    let start = search(s:func,'bn')
    let lines = getline(start)
    return lines
endfunction

" functionの名前を取得する関数
function! GetFunctionName()
    let s:func = GetProgramDefineFunc()
    let tmp = match(GetFunc(), s:func)
    let function_name = strpart(GetFunc(),tmp)
    let function_name = substitute(function_name, s:func , '', 'g')
    let tmp = match(function_name,'(.*)')
    let function_name = strpart(function_name,0 , tmp)
    let function_name = substitute(function_name,'(.*)', '', 'g')
    let function_name = substitute(function_name, '\(^\s\+\)\|\(\s\+$\)', '', 'g')
    return function_name
endfunction

"QuickRunの設定
let g:quickrun_config = {
    \   "_" : {
    \       "outputter/buffer/split" : ":botright",
    \       "outputter/buffer/close_on_empty" : 1
    \   },
    \}
"------------------------------------
"" sass
"------------------------------------
"""{{{
"let g:sass_compile_auto = 1
"let g:sass_compile_cdloop = 5
"let g:sass_compile_cssdir = ['css', 'stylesheet']
"let g:sass_compile_file = ['scss', 'sass']
"let g:sass_started_dirs = []
" 
"autocmd FileType less,sass setlocal sw=2 sts=2 ts=2 et
"au! BufWritePost * SassCompile
"}}}

"------------------------------------
"" vimのタブ化
"------------------------------------
" Anywhere SID.
"function! s:SID_PREFIX()
"  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
"endfunction
"
"" Set tabline.
"function! s:my_tabline()  "{{{
"  let s = ''
"  for i in range(1, tabpagenr('$'))
"    let bufnrs = tabpagebuflist(i)
"    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
"    let no = i  " display 0-origin tabpagenr.
"    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
"    let title = fnamemodify(bufname(bufnr), ':t')
"    let title = '[' . title . ']'
"    let s .= '%'.i.'T'
"    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
"    let s .= no . ':' . title
"    let s .= mod
"    let s .= '%#TabLineFill# '
"  endfor
"  let s .= '%#TabLineFill#%T%=%#TabLine#'
"  return s
"endfunction "}}}
"let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
"set showtabline=2 " 常にタブラインを表示
"
"" The prefix key.
""nnoremap [Tag] <Nop>
""nmap t [Tag]
"" Tab jump
"for n in range(1, 9)
"  execute 'nnoremap <silent> tn :<C-u>tabnext'.n.'<CR>'
"endfor
"" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
"
"map <silent> tc :tablast <bar> tabnew<CR>
"" tc 新しいタブを一番右に作る
"map <silent> tx :tabclose<CR>
"" tx タブを閉じる
"map <silent> tn :tabnext<CR>
"" tn 次のタブ
"map <silent> tp :tabprevious<CR>
"" tp 前のタブ

"----------------------------------------------------------+
" エラー行の背景色変更
"----------------------------------------------------------+

" キーバインドとautocmd設定
nnoremap <Space> :call JumpToPHPError()<CR>
autocmd BufEnter,BufWritePost *.php call CheckErrorLine()

" エラー箇所にジャンプ
function! JumpToPHPError()
  silent! exe 'sign jump 99999 buffer='.winbufnr(0)
endfunction

" エラー箇所をハイライト
function! CheckErrorLine()

  " とりあえず消す.
  "syntax on
  silent! exe 'sign unplace 99999 buffer=' . winbufnr(0)

  " チェックを実行(PHP)
  let l:tmp = system("php -l ".bufname(""))

  " エラーがあった場合
  if ! (l:tmp =~ "No syntax errors" )
      let s:line = matchstr(l:tmp,'on line \d\+')
      let l:line = split(s:line, 'line ')
      "syntax off

     silent exe 'sign define PHPERROR text=>> linehl=ECOLOR texthl=ECOLOR'
     silent exe 'sign place 99999 line=' . l:line[1] . ' name=PHPERROR buffer=' . winbufnr(0)
     silent exe 'hi ECOLOR ctermfg=Yellow ctermbg=Red cterm=none'

     return
  endif

  return
endfunction
