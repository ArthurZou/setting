set rtp+=$HOME/.arthurzou/.vim

let g:SuperTabDefaultCompletionType="context"
let g:SuperTabRetainCompletionType = 2
let g:SuperTabContextDefaultCompletionType = "<c-n>"


if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Encoding setting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set encoding=utf-8
filetype plugin indent on
syntax on



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI setting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"color scheme
set incsearch
set ignorecase
set smartcase
set statusline=%2*%n%m%r%h%w%*\ %F\ %1*[FORMAT=%2*%{&ff}:%{&fenc!=''?&fenc:&enc}%1*]\ [TYPE=%2*%Y%1*]\ [ROW=%2*%03l%1*/%3*%L(%p%%)%1*]\ [COL=%2*%03v%1*]

" editor settings
set history=1000
set nocompatible
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
set fdm=indent
set autoindent
set smartindent     " indent when

let &guicursor = &guicursor . ",a:blinkon0"
" set cursorline
set gcr=a:block-blinkon0
set nu    
set tags=tags;
set autochdir
" set list
set listchars=tab:>-,eol:-
set ts=2
set expandtab
set shiftwidth=2
set nobackup
set hlsearch
set colorcolumn=80
" set smartindent
" set autoindent
" set cindent
set showmatch
set mouse=r


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglsit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_Menu=1
let Tlist_Auto_Open = 0
let Tlist_Use_Left_Window = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTree_title="[NERDTree]" 
let NERDTreeWinPos="right"
let NERDTreeWinSize = 35
let NERDTreeShowBookmarks=1
"autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set rtp+=~/.arthurzou/.vim/bundle/YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.arthurzou/.ycm_extra_conf.py'





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("cscope")  
	set csprg=/home/arthurzou/.arthurzou/bin/cscope  
	set cspc=3
	"add any database in current dir  
	 if filereadable("cscope.out")  
	      cs add cscope.out  
	     "else search cscope.out elsewhere  
     else  
          let cscope_file=findfile("cscope.out", ".;")  
          let cscope_pre=matchstr(cscope_file, ".*/")  
	      if !empty(cscope_file) && filereadable(cscope_file)  
	           exe "cs add" cscope_file cscope_pre  
	      endif        
	  endif  
endif  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <leader>b :e# <CR><CR>
nmap <leader>n :bn <CR><CR>
nmap <leader>a :A <CR><CR>
nmap <leader>av :AV <CR><CR>
nmap <leader>as :AS <CR><CR>
nmap <F2> :Tlist <CR><CR>
nmap <F3> :NERDTreeToggle <CR><CR>
nnoremap <F4> :set list!<CR>
"cpplint.py [--verbose=1|2|3|4] [--output=vs7|emacs] [--filter=-x,+y,...build|whitespace|comma] 
"[--counting=total|toplevel|detailed] <file> [*] ...
"%: filename
"%<: 为不带扩展名的当前文件名
nnoremap <F5> :!cpplint.py  --verbose=1  --counting=toplevel %<CR>
nnoremap <F6> :%s/\s\+$//g<CR>
vnoremap <leader>c :w/tmp/arthurzou_copy.1<CR><CR>
vnoremap <leader>c2 :w/tmp/arthurzou_copy.2<CR><CR>
noremap <leader>p :r/tmp/arthurzou_copy.1<CR>
noremap <leader>p2 :r/tmp/arthurzou_copy.2<CR>

