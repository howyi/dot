" 行数表示
set number

" エンコード
set encoding=utf-8

" フォーマットの自動判別、新規改行はLF固定
set fileformats=unix,dos,mac

" tabを表示する
set list
set listchars=tab:>-

" スワップの無効化
set noswapfile

" ソフトTab要らなし
set noexpandtab
set tabstop=4
set shiftwidth=4

" マウス
set mouse=a
set ttymouse=xterm2

if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

syntax on

" hybridの設定
set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid
