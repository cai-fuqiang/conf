call plug#begin('~/.nvim/plugged') 
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'mileszs/ack.vim' 
Plug 'preservim/tagbar'

Plug 'ferrine/md-img-paste.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
"Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Plug 'Yggdroot/indentLine'
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'       
Plug 'vim-airline/vim-airline-themes' "airline 的主题
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
"Plug 'voldikss/vim-translator'
"Plug 'haohaiwei/gtrans'
"Plug 'iamcco/dict.vim'
Plug 'voldikss/vim-translator'
Plug 'dhananjaylatkar/cscope_maps.nvim' " cscope keymaps
Plug 'folke/which-key.nvim' " optional [for whichkey hints]
Plug 'nvim-telescope/telescope.nvim' " roptional [for picker='telescope']
Plug 'ibhagwan/fzf-lua' " optional [for picker='fzf-lua']
Plug 'nvim-tree/nvim-web-devicons' " optional [for devicons in telescope or fzf]
Plug 'mhinz/vim-startify'

Plug 'brooth/far.vim'

Plug 'rking/ag.vim'
call plug#end()
lua << EOF
  require("cscope_maps").setup()
EOF
set number
let mapleader = ","
set t_Co=256             " 开启256色支持
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set cursorline           " 高亮显示当前行
set autowrite      	 " 设置自动保存
set expandtab            " 将制表符扩展为空格
set tabstop=8           " 设置编辑时制表符占用空格数
set shiftwidth=8         " 设置格式化时制表符占用空格数
set softtabstop=8        " 设置4个空格为制表符
set nofoldenable
set nowrap
highlight link RnvimrNormal CursorLine
set guifont='\Intel\ One\ Mono'
" Yggdroot/indentLine
" let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
" let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

" vim monokai
colo monokai

" nerdtree
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>



"ctags
if filereadable("cscope.out")
    set tags=tags
elseif $CSCOPE_DB != ""
    set tags=$TAGS_DB
endif

"cscope
cmap cs Cscope
nmap <C-\>s :Cscope find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :Cscope find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :Cscope find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :Cscope find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :Cscope find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :Cscope find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :Cscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :Cscope find d <C-R>=expand("<cword>")<CR><CR>

"md-img-paste
let g:mdip_imgdir = 'pic'
let g:mdip_imgname = 'image'
autocmd FileType markdown nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i

" coc.nvim
let g:coc_global_extensions = [
	\ 'coc-css',
    \ 'coc-diagnostic',
    \ 'coc-docker',
    \ 'coc-eslint',
    \ 'coc-explorer',
    \ 'coc-flutter-tools',
    \ 'coc-gitignore',
    \ 'coc-html',
    \ 'coc-import-cost',
    \ 'coc-java',
    \ 'coc-jest',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-omnisharp',
    \ 'coc-prettier',
    \ 'coc-prisma',
    \ 'coc-pyright',
    \ 'coc-snippets',
    \ 'coc-sourcekit',
    \ 'coc-stylelint',
    \ 'coc-syntax',
    \ 'coc-tailwindcss',
    \ 'coc-tasks',
    \ 'coc-translator',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-vimlsp',
    \ 'coc-yaml',
	\ 'coc-vimlsp',
    \ 'coc-yank']

" vim -markdown
let g:vim_markdown_conceal = 1
set conceallevel=2
set concealcursor="nc"
let g:indentLine_concealcursor = ''
"let g:vim_markdown_folding_disabled = 1

" vim-easymotion
let g:EasyMotion_smartcase = 1 
map <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

""" Configuration example
" Echo translation in the cmdline
nmap <silent> <Leader>a <Plug>Translate
vmap <silent> <Leader>a <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>s <Plug>TranslateW
vmap <silent> <Leader>s <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>r <Plug>TranslateR
vmap <silent> <Leader>r <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <Leader>x <Plug>TranslateX

let g:translator_default_engines = ['haici']

" 有道翻译2
"let g:api_key = "1932136763"
"let g:keyfrom = "aioiyuuko"
"" let g:debug_dict = 1
""--普通模式下，<Leader>d 即可翻译光标下的文本，并在命令行回显
"nmap <silent> <Leader>d <Plug>DictSearch
""--可视化模式下，<Leader>d 即可翻译选中的文本，并在命令行回显
"vmap <silent> <Leader>d <Plug>DictVSearch

" 注释颜色
hi comment ctermfg=6

" leaderF
let g:Lf_WindowPosition = 'popup'
