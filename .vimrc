" dein
":call dein#install()
if &compatible
  set nocompatible
endif
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/neocomplcache.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-syntastic/syntastic')
  " call dein#add('kien/ctrlp.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('yuroyoro/smooth_scroll.vim')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('Lokaltog/vim-powerline')
  " call dein#add('itchyny/lightline.vim')
  call dein#add('rking/ag.vim')
  call dein#add('vim-scripts/gitignore')
  call dein#add('szw/vim-tags')
  call dein#add('aereal/vim-colors-japanesque')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('junegunn/fzf.vim')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('othree/yajs.vim', {'autoload':{'filetypes':['javascript']}})
  call dein#add('junegunn/vim-easy-align')
  " call dein#add('pangloss/vim-javascript')
  " call dein#add('taichouchou2/vim-javascript')
  call dein#add('posva/vim-vue')
  call dein#add('hashivim/vim-terraform')
  call dein#add('juliosueiras/vim-terraform-completion')

  " ruby
  call dein#add('tpope/vim-rails')
  " call dein#add('tpope/vim-bundler')
  call dein#add('tpope/vim-endwise')

  " git
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')


  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

"----------------------------------------------------------+
" Basic Setup                                              |
"----------------------------------------------------------+

set nocompatible
filetype off
filetype indent on

"色の設定
" hi Search term=reverse ctermfg=black
" hi Pmenu ctermfg=black
" hi PmenuSel ctermfg=black

" item2用
" download https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
syntax enable
set term=screen-256color
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
set t_Co=256

" 行数の色
" hi LineNr ctermbg=0 ctermfg=2
" hi CursorLineNr ctermbg=2 ctermfg=0
" set cursorline
" hi clear CursorLine

"行番号の表示/非表示
set nu

" 自動インデント
set autoindent

" タブ入力がスペース
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

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
hi Search guibg=Yellow ctermbg=Yellow

" スクロール高速
set lazyredraw
set ttyfast

"vimrcの読み込み
:command! Vimrc :e ~/.vimrc

" カーソルを行頭、行末でとまらないようにする
"set whichwrap=b,s,h,l,<,>,[,]
"set cursorline " カーソルラインをハイライト

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

" 文字崩れ対応
set ambiwidth=double

" クリップボードにコピー
set clipboard=unnamed,autoselect
" set clipboard+=unnamed

" ディレクトリを移動
set autochdir

"----------------------------------------------------------+
" キーバインド変更                                         |
"----------------------------------------------------------+

" 入力モード中に素早くjjと入力した場合はESCとみなすと同時に保存
inoremap <silent> jj <ESC>:<C-u>w<CR>

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
nnoremap <C-m><C-b> <C-^>

" 空行を挿入する
" http://vim-users.jp/2009/08/hack57/
nnoremap 0 :<C-u>call append(expand('.'), '')<Cr>j

" ヤンクしたあとに削除しても貼り付ける
nnoremap gy "0P

"<F6>  文頭にタイムスタンプを挿入してinsertモードへ移行
nmap <F6> <ESC>i<C-R>=strftime("%Y-%m-%d (%a)")<CR><CR>

" 全角文字にしたときに赤くする
if has('multi_byte_ime') || has('xim')
  highlight Cursor guifg=NONE guibg=White
  highlight CursorIM guifg=NONE guibg=DarkRed
endif

" visual modeのu or Uでの文字置換をやめる
vnoremap U <ESC>
vnoremap u <ESC>
"----------------------------------------------------------+
" pluginの設定                                             |
"----------------------------------------------------------+
" fzf
set rtp+=~/.fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

:command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <silent> <C-p> :ProjectFiles<CR>
nnoremap <silent> <M-p> :History<CR>

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

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
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
" autocmd FileType vue syntax sync fromstart
" autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" ag
let g:ag_working_path_mode="r"

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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
"nnoremap <silent> ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ua :<C-u>UniteWithBufferDir -buffer-name=files bufferfile_mru bookmark file<CR>

" grep
nnoremap <Space>g :<C-u>Unite grep:<C-r>=expand(system('git rev-parse --show-toplevel 2> /dev/null')[:-2]) <CR>
nnoremap <silent> ug :<C-u>Unite grep: -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,r :<C-u>UniteResume search-buffer<CR>
vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" ag
nmap <Space><Space> :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag 

" NERDTREE
"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
"let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
"let g:NERDTreeWinSize = 50
"let NERDTreeShowHidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

"https://qiita.com/5t111111/items/969783048467b733b62b
command! RailsSpec echo s:rails_spec(expand('%:p'), getpos('.'))

function! s:rails_spec(file, pos)
  let l:cmd = printf('tmux-send-key bundle exec rspec %s:%d', a:file, a:pos[1])
  return system(l:cmd)
endfunction

nnoremap <F4> :<C-u>RailsSpec<Return>

" vim-terraform
let g:terraform_fmt_on_save = 1

" vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [
  \ 'ruby', 'javascript','coffee', 'scss', 'html', 'haml', 'slim', 'sh',
  \ 'spec', 'vim', 'zsh', 'sass', 'eruby'] }

" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_coffee_checkers = ['coffeelint']
" let g:syntastic_scss_checkers = ['scss_lint']
" let g:syntastic_ruby_checkers = ['rubocop']

let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

" vue
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
    let g:syntastic_vue_eslint_exec = local_eslint
endif
"----------------------------------------------------------+
"  ステータスライン                                        |
"----------------------------------------------------------+

" ステータスラインを常に表示,色変更
" set laststatus=2
" hi StatusLine ctermfg=White ctermbg=Blue cterm=none
" au InsertEnter * hi StatusLine ctermfg=Black ctermbg=yellow cterm=none
" au InsertLeave * hi StatusLine ctermfg=White ctermbg=Blue cterm=none

"autocmd BufEnter,BufWritePost * call ErrorCheckStatusline()

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
  endif

  " 通常のステータスラインを表示
  "silent exec 'set statusline=%F,\ \ %{GetFunctionName()}%=%l/%L%11p%%'
  "silent exec g:ncol
  return
endfunction

"----------------------------------------------------------+
"  Program                                                 |
"----------------------------------------------------------+
" Python
"let python_highlight_all = 1
"autocmd FileType python set omnifunc=pythoncomplete
"autocmd FileType python set omnifunc=pysmell
let g:syntastic_python_python_exec = '/usr/bin/python'
"let g:syntastic_python_checkers = ['pyflakes', 'pep8']
:let g:syntastic_python_checkers=['python']

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
    \       "outputter/buffer/split" : ":botright 8sp",
    \       "outputter/buffer/close_on_empty" : 1
    \   },
    \}

au FileType qf nnoremap <silent><buffer>q :quit<CR>
