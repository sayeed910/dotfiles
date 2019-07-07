
call plug#begin('~/.local/share/nvim/plugged')
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/xoria256.vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'honza/vim-snippets'
Plug 'joshdick/onedark.vim'
Plug 'mileszs/ack.vim'
Plug '/usr/share/fzf'
Plug 'junegunn/fzf.vim'
Plug 'posva/vim-vue'

call plug#end()

"----------------------------coc.nvim-------------------------------"
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"------------------------------Colorscheme-------------------------"
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:onedark_terminal_italics=1

colorscheme onedark





"-----------------------------Config---------------------------------"
set relativenumber
set nu
filetype plugin on
"set omnifunc=syntaxcomplete#Complete
set autoindent
set smartindent

set shiftwidth=2
set tabstop=2
let mapleader=','												"Set leader to ,
set autowriteall												"Automatically save on buffer change
set path+=$PWD/**
set wildmenu
set wildmode=list:longest,full
set wildignore+=**/node_modules/** 


"----------------------------Search----------------------------------"
set hlsearch
set incsearch




let g:ctrlp_working_path_mode = 'ra'

let g:UltiSnipsExpandTrigger="<c-j>"




"--------------------Split Management-------------------------"
nmap <Leader>j <c-w><c-j>
nmap <Leader>k <c-w><c-k>
nmap <Leader>h <c-w><c-h>
nmap <Leader>l <c-w><c-l>
nnoremap <c-u> 1<c-u>

"--------------------Mappings-------------------------"
inoremap jj <Esc>
map <c-l> mzgg=G`z
nnoremap 0 ^
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add highlight removal"
nmap <Leader><space> :nohlsearch<cr>

"Get the tags for the current file"
nmap <Leader>r :CtrlPBufTag<cr>

"Get the most recently used files"
nmap <Leader>e :CtrlPMRUFiles<cr>

"Find symbol in workspace
nmap <Leader>f :tag<space>

"Write a ; at the end of line"
inoremap <c-d> <esc>A;

"Write a ; at the end of line"
inoremap <c-f> <esc>A{}<left>

"---------------------Plugin Config--------------------"

"/
"/CtrlP
"/

let g:ctrlp_custom_ignore = 'node_modules\|\.git\|vendor'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/
"/Ack
"/

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack

"---------------------Autocommands--------------------"

augroup autosourcing
	autocmd!
	"Source .vimrc file everytime I write it"
	autocmd BufWritePost init.vim source %
augroup END

if @% != ""
	autocmd TextChanged,TextChangedI <buffer> silent write
endif


augroup phpmaps
	autocmd!

	"Map t to run phpunit on composer project"
	autocmd FileType php          nnoremap <buffer> t :!vendor/bin/phpunit<CR>
	
	"Map $ to expand $this->"
	autocmd FileType php          inoremap <buffer> $. $this->


augroup pythonmaps
	autocmd!

	"Map r to run python files"
	autocmd FileType python          nnoremap <buffer> run :!python3 %<CR>
	
	"Map t to run python files"
	autocmd FileType python          nnoremap <buffer> t :!python3 -m pytest<CR>

autocmd FileType json syntax match Comment +\/\/.\+$+
	


