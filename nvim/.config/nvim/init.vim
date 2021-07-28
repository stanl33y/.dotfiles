call plug#begin("~/.config/nvim/plugged")
  " Theme
  Plug 'dracula/vim'
  
  " EditorConfig
  Plug 'editorconfig/editorconfig-vim'

  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json',  'coc-eslint', 'coc-prettier', 'coc-tsserver']
  
  " Highlighting
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql' 
  Plug 'maxmellon/vim-jsx-pretty'

  " Autoindent
  Plug 'sheerun/vim-polyglot'
  
  " Fazer fechamento automático de pares (parênteses, colchetes, aspas, etc)
  Plug 'jiangmiao/auto-pairs'

  " Emmet
  Plug 'mattn/emmet-vim'
  
  " .net core
  Plug 'OmniSharp/omnisharp-vim'

  "  File Explorer with Icons
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
 
  " Commenter
  Plug 'preservim/nerdcommenter'

  " Multiple Cursors
  Plug 'terryma/vim-multiple-cursors'
  
  " File Search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  
  "GIT
  Plug 'tpope/vim-fugitive'
  
  " Suporte para smooth scrolling
  Plug 'yuttie/comfortable-motion.vim'

  " Status Line
  Plug 'itchyny/lightline.vim'
  
  " Debug
  Plug 'puremourning/vimspector'
  Plug 'szw/vim-maximizer'

  " Git Blamer
  Plug 'iamcco/sran.nvim', { 'do': { -> sran#util#install() } }
  Plug 'iamcco/git-p.nvim'

  " Search 
  Plug 'dyng/ctrlsf.vim'
call plug#end()

set t_Co=256                " Habilita suporte completo a cores no Vim
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set smartcase               " Sobrescreve o `ignorecase` quando houver caracteres em maísuculo na busca 
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set smarttab
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
" set relativenumber          " exibir números de linha acima ou abaixo relativos a linha atual 
set wildmode=longest,list   " get bash-like tab completions
set colorcolumn=80          " set an 80 column border for good coding style
set cursorline              " Marcar linha atual
set encoding=UTF-8          " Seta o encoding para utf8
set hidden                  " permite editar outros arquivos sem salvar um antes de abrir outro
set nowrap                  " Não quebrar linhas por padrão. Para definir quebra de linha, só entrar no arquivo e digitar :set wrap
set clipboard+=unnamedplus  " Permite copiar do clipboard para o vim e do vim para o clipboad
" set undofile                " Salva automaticamente um histórico de ações para desfazer, ainda que o vim seja fechado
set list                    " Habilita a exibição de caracteres ocultos
" Define como os símbolos ocultos serão representados
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=eol:↴
set listchars+=nbsp:_

filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif



" ####################################################
" Theme
" ####################################################
let g:dracula_colorterm = 0
colorscheme dracula

" ####################################################
" NERDTree
" ####################################################
" nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>    

let g:NERDTreeShowHidden = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ####################################################
" NERDTree Git Plugin
" ####################################################
let g:NERDTreeGitStatusUseNerdFonts = 1
" let g:NERDTreeIndicatorMapCustom = { "Modified": "✹", "Staged": "✚", "Untracked": "✭", "Renamed": "➜", "Unmerged": "═", "Deleted": "✖", "Dirty": "✗", "Clean": "✔︎", "Ignore": "☒", "Unknown": "?" }  

" ####################################################
" FZF - File Search
" ####################################################
nnoremap <C-p> :FZF<CR>
let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" ####################################################
" LightLine 
" ####################################################
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"let g:lightline = {
      "\ 'colorscheme': 'dracula',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ],
      "\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      "\ },
      "\ 'component_function': {
      "\   'gitbranch': 'FugitiveHead'
      "\ },
      "\ }

" ####################################################
" Code Completions 
" ####################################################
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" ####################################################
" Switch Panel
" ####################################################
" open new split panes to right and below
set splitright
set splitbelow

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"-- FOLDING --
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
let TypeScript_fold=1 "activate folding by TS syntax
set foldlevelstart=99 "start file with all folds opened

" Highlighting for large files 
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
" VIMRC config
nnoremap <silent> <Leader>v :tabe $MYVIMRC<cr>
nnoremap <silent> <Leader><Leader> :source $MYVIMRC<cr>

" Git Blamer
let g:gitp_blame_virtual_text = 1
highlight link GitPBlameLine GitPBlameLineHi
let g:gitp_blame_format = '    %{account}, %{ago} * %{commit}'
highlight link GitPAdd                GitPAddHi
highlight link GitPModify             GitPModifyHi
highlight link GitPDeleteTop          GitPDeleteHi
highlight link GitPDeleteBottom       GitPDeleteHi
highlight link GitPDeleteTopAndBottom GitPDeleteHi
let g:gitp_add_sign = '■'
let g:gitp_modify_sign = '▣'
let g:gitp_delete_top_sign = '▤'
let g:gitp_delete_bottom_sign = '▤'
let g:gitp_delete_top_and_bottom_sign = '▤'
nmap <leader>d <Plug>(git-p-diff-preview)
nmap <leader>s <Plug>(git-p-show-blame)
highlight link GitPDiffFloat Pmenu

fun GotoWindow(id)
  call win_gotoid(a:id)
  MaximizerToggle
endfun

" Enable debug
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

"let g:vimspector_enable_mappings = 'HUMAN'
"autocmd FileType java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>
"

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>


" Buffer navigation
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bl :blast<CR>
nnoremap <leader>bf :bfirst<CR>
