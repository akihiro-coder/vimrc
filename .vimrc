"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/akihiro/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/akihiro/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/home/akihiro/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:

" python complementation
call dein#add('davidhalter/jedi-vim')
" brackets complementation
call dein#add('cohama/lexima.vim') " pep8 regulation checker 
" call dein#add('andviro/flake8-vim')

call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1

call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')


call dein#add('easymotion/vim-easymotion')
call dein#add('preservim/nerdtree')

" vim theme 'gruvbox'
call dein#add('morhetz/gruvbox')

" tab complementation
call dein#add('ervandew/supertab')

" markdown preview
call dein#add('skanehira/preview-markdown.vim')


" git on vim
call dein#add('tpope/vim-fugitive')

" search code
call dein#add('jremmen/vim-ripgrep')

" commentary
call dein#add('tpope/vim-commentary')

" fussy finder
call dein#add('ctrlpvim/ctrlp.vim')

" easy resizing of vim windows
call dein#add('simeji/winresizer')



" Required:
call dein#end()

" Required: filetype plugin indent on
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------







" 行番号の表示
set number 
" 検索結果をハイライト
set hlsearch
" インクリメンタル検索（検索ワードの最初の文字を入力した時点で検索が開始）
set incsearch
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan 
" 検索するとき大文字と小文字を区別しない
set ignorecase
" コメントの色を水色
hi Comment ctermfg=3
" tabキーで半角スペースを挿入"  
set expandtab
" インデント幅
set shiftwidth=2
" タブキー押下時に挿入される文字幅を指定
set softtabstop=2
" ファイル内にあるタブ文字の表示幅
set tabstop=2
" タイトルを表示
set title
" カーソル位置を表示
set cursorline
" syntax highlight
syntax enable
" クリップボード設定
set clipboard+=unnamed
" ステータスラインの設置
set laststatus=2
" 行末の一行先までカーソル移動できるようにする
set virtualedit=onemore
" コマンドラインモードでのtab補完機能
set wildmenu
" set vim color
colorscheme default
" esc key 二回押せばハイライトが消える
nnoremap <ESC><ESC> :nohlsearch<CR>


" カーソルを縦棒にする
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

" F3 key relative number display change
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>


" <F5>で編集中のファイルを実行
nmap <F5> :!python3 %



"autopep8を<sift>+fで実行
"pip install autopep8(下の記述の前に実行しておく)
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction
function! Autopep8()
    call Preserve(':silent %!autopep8 --ignore=E501 -')
endfunction
autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>




" shift + h -> start
" shift + l -> end
noremap <S-h> 0
noremap <S-l> $
 
 
map  W <Plug>(easymotion-bd-w)
nmap W <Plug>(easymotion-overwin-w)
nmap S <Plug>(easymotion-overwin-f2)

nnoremap <C-n> :NERDTreeToggle<CR>

nmap <S-w> <C-w><C-w>





"" vim起動時にタッチパッド無効化                                                                  
"augroup entercmd                                                                    
"  autocmd!                                                                          
"  autocmd VimEnter * silent !xinput disable 13
"augroup END                                                                         
"
"" vim終了時にタッチパッド有効化                                                                       
"augroup quitcmd                                                                     
"  autocmd!                                                                          
"  autocmd VimLeave * !xinput enable 13                                      
"augroup END                                                                         
"
"
"
"
"" スペースd でタッチパッド無効化 (normal mode)                                                                                  
nnoremap <space>d :<C-u>!xinput disable 12<cr><esc>
"
""スペースe でタッチパッド有効化 (normal mode)                                
nnoremap <space>e :<C-u>!xinput enable 12<cr><esc>  




" molokai colorscheme setting
"syntax on
"colorscheme molokai
"set t_Co=256


" gruvbox vim theme
autocmd vimenter * ++nested colorscheme gruvbox
:set bg=dark


let g:SuperTabDefaultCompletionType = "<c-n>"

" autocmd VimEnter * execute 'NERDTree'




" snippets setting
" https://github.com/Shougo/neosnippet.vim#configuration
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'



" winresizer setting 
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1

" キーワードにマッチした数を表示
set shortmess-=S



" display git branch name in status line
set statusline=%<     " 行が長すぎるときに切り詰める位置
set statusline+=[%n]  " バッファ番号
set statusline+=%m    " %m 修正フラグ
set statusline+=%r    " %r 読み込み専用フラグ
set statusline+=%h    " %h ヘルプバッファフラグ
set statusline+=%w    " %w プレビューウィンドウフラグ
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
set statusline+=%y    " バッファ内のファイルのタイプ
set statusline+=\     " 空白スペース
if winwidth(0) >= 130
  set statusline+=%F    " バッファ内のファイルのフルパス
else
  set statusline+=%t    " ファイル名のみ
endif
set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
set statusline+=\ \   " 空白スペース2個
set statusline+=%1l   " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L    " バッファ内の総行数
set statusline+=,
set statusline+=%c    " 何列目にカーソルがあるか
set statusline+=%V    " 画面上の何列目にカーソルがあるか
set statusline+=\ \   " 空白スペース2個
set statusline+=%P    " ファイル内の何％の位置にあるか 






tnoremap <ESC> <C-w> N
tnoremap <S-w> <C-w><C-w>
