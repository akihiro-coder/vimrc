call plug#begin()

" preview uml
Plug 'skanehira/preview-uml.vim'

" git signs on neovim
Plug 'lewis6991/gitsigns.nvim'

" git operation on neovim
Plug 'dinhhuy258/git.nvim'

" vim highlight
Plug 'sheerun/vim-polyglot'

" syntax plugin
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" indent blankline
Plug 'lukas-reineke/indent-blankline.nvim'

" colorscheme
Plug 'folke/tokyonight.nvim'

" terminal window in vim 
Plug 'voldikss/vim-floaterm'

" vim status-bar modernization
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
" Plug 'nvim-tree/nvim-web-devicons'

" fussy searching
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'rev': '0.1.2' }


" complementation
" Plug 'neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' }
Plug 'neoclide/coc.nvim', { 'branch': 'release'}

" brackets complementation
Plug 'itmammoth/doorboy.vim'

" fast move on code
Plug 'easymotion/vim-easymotion'

" filer 
" Plug 'preservim/nerdtree'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" colorscheme
Plug 'ellisonleao/gruvbox.nvim'

" tab complementation
Plug 'ervandew/supertab'

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown']}


" search code
" call dein#add('jremmen/vim-ripgrep')

" commentary
Plug 'tpope/vim-commentary'

" easy resizing of vim windows
Plug 'simeji/winresizer'

" fuzzy finder (fussy searching)
" call dein#add('junegunn/fzf', {'build': './install --all'})
" call dein#add('junegunn/fzf.vim')

" noice
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'


call plug#end()



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
" esc key 二回押せばハイライトが消える
nnoremap <ESC><ESC> :nohlsearch<CR>
" time between insert and normal mode 
set ttimeoutlen=10



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
nnoremap <F5> :!python3 %



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
autocmd FileType python nnoremap <C-f> :call Autopep8()<CR>




noremap <C-h> ^
noremap <C-l> $
vnoremap <C-h> ^
vnoremap <C-l> $
 
" easymotion settings
" s{char}{char} to move to {char}{char}
map <leader>s <Plug>(easymotion-bd-f2)
nmap <leader>s <Plug>(easymotion-overwin-f2)
" Move to line
map <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)


"nerdtree
" nnoremap <C-n> :NERDTreeToggle<CR>
" filer
nnoremap <C-n> :NvimTreeOpen<CR>

lua << END
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
END




" window change
map <leader>w <C-w><C-w>




nnoremap <space>d :<C-u>!xinput disable 12<cr><esc>
"
""スペースe でタッチパッド有効化 (normal mode)                                
nnoremap <space>e :<C-u>!xinput enable 12<cr><esc>  





let g:SuperTabDefaultCompletionType = "<c-n>"

" autocmd VimEnter * execute 'NERDTree'






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
"set statusline+=%{fugitive#statusline()}  
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''} " Gitのブランチ名を表示
set statusline+=\ \   " 空白スペース2個
set statusline+=%1l   " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L    " バッファ内の総行数
set statusline+=,
set statusline+=%c    " 何列目にカーソルがあるか
set statusline+=%V    " 画面上の何列目にカーソルがあるか
set statusline+=\ \   " 空白スペース2個
set statusline+=%P    " ファイル内の何％の位置にあるか 


nnoremap ; :
nnoremap : ;
inoremap ; :
inoremap : ;




let g:coc_disable_startup_warning = 1



"coc.nvim settings
"\hでHover
nmap <silent> <leader>hh <C-u>call CocAction('doHover')<cr>
"\dfで定義ジャンプ
nmap <silent> <leader>df <Plug>(coc-definition)
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif




" fussy finder settings
nnoremap <leader>ff <cmd>Telescope find_files hidden=true theme=get_dropdown<cr>
nnoremap <leader>fg <cmd>Telescope live_grep theme=get_dropdown<cr>


" enterで補完候補を選択できるように
inoremap <silent><expr> <Enter> coc#pum#visible() ? coc#pum#confirm() : "\<Enter>"


" vim-airline config
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme = 'murmur'
" nmap <S-h> <Plug>AirlineSelectPrevTab
" nmap <S-l> <Plug>AirlineSelectNextTab

" lualine config
lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nightfly',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{
        'filename',
        file_status=true,
        path=2
    }},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
END


" froaterm Configuration
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

colorscheme tokyonight-night




" set plantuml server url" In your init.lua or init.vim
let g:preview_uml_url='http://localhost:8888'


" markdownpreview config
let g:mkdp_open_to_the_world = 1
let g:mkdp_open_ip = '192.168.3.9' " change to you vps or vm ip
let g:mkdp_port = 8080
function! g:EchoUrl(url)
    :echo a:url
endfunction
let g:mkdp_browserfunc = 'g:EchoUrl'



" noice config
lua << END
require("noice").setup()
END
