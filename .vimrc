""" my own vimrc :)

""" colours
syntax enable
highlight LineNr term=NONE cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

highlight VertSplit term=NONE cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
""" tabs
set tabstop=4		" space for tabs read
set softtabstop=4	" space for tabs input
set noexpandtab		" use tabs not spaces
set shiftwidth=4	" indenting space
set autoindent	
set smartindent
set cindent			" stricter rules for c programs

""" ui
set number			" show line numbers
" set cursorline	" show a horizontal line at the cursor
set wildmenu		" menu for selecting autocompleted files
set showmatch		" show matching ({[]})

""" searching 
set incsearch       " search as characters are entered
set hlsearch        " highlight matches

" turn off search highlight after entering instert mode
for s:c in ['a', 'A', '<Insert>', 'i', 'I', 'gI', 'gi', 'o', 'O']
    exe 'nnoremap ' . s:c . ' :nohlsearch<CR>' . s:c
endfor

""" floding
set foldenable      " enable folding

""" movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

""" mouse
set mouse=a			" mouse doesn't select line numbers

""" style guide
" This highlights the background in red 
" for text that goes over the 80 column limit
highlight OverLength ctermbg=red ctermfg=black
match OverLength /\%81v.\+/

""" key remaps
" idk the syntax but something like this:
"nnoremap <Ctrl>z :x :sus
