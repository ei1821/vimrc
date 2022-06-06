let g:polyglot_disabled = ['javascript']
call jetpack#begin()
Jetpack 'itchyny/lightline.vim'
Jetpack 'lambdalisue/fern.vim'
"Jetpack 'lambdalisue/fern-git-status.vim' " fernにgitステータスを表示させる
Jetpack 'lambdalisue/nerdfont.vim'
Jetpack 'lambdalisue/glyph-palette.vim'
Jetpack 'lambdalisue/fern-renderer-nerdfont.vim'
Jetpack 'w0ng/vim-hybrid'
Jetpack 'ryanoasis/vim-devicons' "
Jetpack 'cocopon/lightline-hybrid.vim' " lightlineのカラースチームをhybridにする
Jetpack 'terryma/vim-expand-region' " vの選択範囲を拡大していく
Jetpack 'simeji/winresizer' " ウィンドウサイズの変更を簡単に
"Jetpack 'tpope/vim-fugitive' " git操作
"Jetpack 'airblade/vim-gitgutter' " git関連
Jetpack 'sheerun/vim-polyglot' " 多言語のシンタックスとか色々やってくれるいい子
Jetpack 'othree/yajs.vim'
"Jetpack 'junegunn/fzf.vim'
"Jetpack 'junegunn/fzf', { 'do': {-> fzf#install()} }
Jetpack 'neoclide/coc.nvim', { 'branch': 'release' }
"Jetpack 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
"Jetpack 'vlime/vlime', { 'rtp': 'vim' }
"Jetpack 'dracula/vim', { 'as': 'dracula' }
"Jetpack 'tpope/vim-fireplace', { 'for': 'clojure' }
call jetpack#end()

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
set background=dark
colorscheme hybrid
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
set matchtime=1
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\ ,trail:~
" Tab文字を半角スペースにする
" set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 左右のカーソル移動を行跨ぎ可能に
set whichwrap=b,s,h,l,<,>,[,],~
" マウス操作許可
set mouse=a
" スクロールの余裕を確保
set scrolloff=3
" バックスペースをいつでも有向に
set backspace=indent,eol,start
set gdefault
"行末の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge
"ノーマルモードでEnterを押すとカーソル位置で改行する
nnoremap <CR> i<Return><Esc>^k

inoremap <silent> <S-Del> <Del>
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" Leaderに関する設定
" Leaderをスペースキーに
let mapleader = "\<Space>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>

" ターミナルに関する設定
" ターミナルモードからコマンドモードになるときのキーマップをEcsに
tnoremap <Esc> <C-\><C-n>

" コマンド
" Config : vimの設定ファイルを開く
command! Config :e $MYNVIMRC
" Source : vimの設定ファイルを再読み込みする
command! Source :source $MYNVIMRC


" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

" GitGutterに関する設定
set signcolumn=yes
" Default key mapping off
let g:gitgutter_map_keys = 0
"" git操作
" g]で前の変更箇所へ移動する
nnoremap g[ :GitGutterPrevHunk<CR>
" g[で次の変更箇所へ移動する
nnoremap g] :GitGutterNextHunk<CR>
" ghでdiffをハイライトする
nnoremap gh :GitGutterLineHighlightsToggle<CR>
" gpでカーソル行のdiffを表示する
nnoremap gp :GitGutterPreviewHunk<CR>
" 記号の色を変更する
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red

"" 反映時間を短くする(デフォルトは4000ms)
set updatetime=250

" lightlineに関する設定
let g:lightline = {
		\ 'colorscheme': 'hybrid',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
		\             [ 'fugitive', 'filename' ] ],
		\   'right': [ [ 'lineinfo' ],
    	\              [ 'percent' ],
    	\              [ 'fileformat', 'fileencoding', 'filetype' ] ]
        \ },
      	\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      	\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
		\   'percent': 'LightlinePercent',
		\   'lineinfo': 'LightlineLineinfo',
        \   'mode': 'LightlineMode',
		\   'gitbranch': 'FugitiveHead'
		\ }
        \ }
let g:lightline_hybrid_style = 'default'

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
  		\  &ft == 'fern' ? 'Fern' :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! GetCursorPosPercent()
    return (100 * line('.') / line('$') . '%')
endfunction

function! LightlinePercent()
	return winwidth(0) > 70 ? GetCursorPosPercent() : ''
endfunction

function LightlineLineinfo()
	return winwidth(0) > 60 ? printf("%3d:%-2d", line("."), col(".")) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" Fernに関する設定
" l ディレクトリを開く
" h ディレクトリを閉じる
" C-h 親ディレクトリにもどる
" 隠しファイルを表示する
let g:fern#default_hidden=1
" Fern .をSpace+eキーに置き換え
nnoremap <silent> <Leader>e :Fern . -reveal=% -drawer -toggle -width=40<CR>
let g:fern#renderer = 'nerdfont'
" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" expand-regionに関する設定
vmap v <Plug>(expand_region_expand)
vmap <Leader>v <Plug>(expand_region_shrink)




