if &term =~ "xterm"
	"256 color --
	let &t_Co=256
	" restore screen after quitting
	set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
	if has("terminfo")
		let &t_Sf="\ESC[3%p1%dm"
		let &t_Sb="\ESC[4%p1%dm"
	else
	  let &t_Sf="\ESC[3%dm"
	  let &t_Sb="\ESC[4%dm"
	endif
endif


" Use pathogen to load plugins from bundle directory
filetype off
call pathogen#incubate()
call pathogen#helptags()

set nocompatible
source $VIMRUNTIME/vimrc_example.vim

"Hide GUI things
"set guioptions-=m
"set guioptions-=T

au BufNewFile,BufRead *.aspx,*.ascx set filetype=html

"turn off stupid bell sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

let mapleader=','

set ai "autoindent
set tabstop=4
set shiftwidth=4
set noexpandtab

set nu "Show line numbers

set incsearch "find results as you type
set ignorecase "ignore case when searching
set smartcase "override ignorecase when pattern contains a capital letter
set noshowmatch

"Start in full screen
au GUIEnter * simalt ~x
map <leader>F :simalt ~x<CR>

"have 0 go to first nonblank character
map 0 ^

set guifont=Consolas:h10

color codeschool

"Persist undo

let undo_dir = $TEMP."\\vimundo"
if !isdirectory(undo_dir)
	silent execute "!mkdir ".undo_dir
endif
set undodir=$TEMP\vimundo "not sure how to use the variable I made here
set undofile
set undolevels=5000

runtime macros/matchit.vim
autocmd BufNewFile,BufRead *.vb set ft=vbnet

"Allows % to move between braces in inline css
autocmd filetype html let b:match_debug=1

"Treat all numbers as decimal
set nrformats=

nmap <space> zz

"Workaround because S doesn't work with indentation in visual studio
"nmap S ddO

"Double ESC turns off seach highlighting
nmap <silent> <ESC><ESC> :noh<CR>
nnoremap <silent> <c-l> :noh<cr><c-l>

"New lines while staying in normal mode
nmap <Enter> o<Esc>
nmap <S-Enter> O<Esc>

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i

map <leader>te :tabedit 
map <leader>tm :tabmove 
map <leader>tl :tablast<CR>
map <leader>tf :tabfirst<CR>
map <leader>tn :tabnew<CR>

"Buffer navigation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <leader>b :buffer 

"Easy VIMRC editing
map <leader>rc :tabedit $MYVIMRC<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>

"opening definitions
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Get rid of those annoying underlines in HTML
let html_no_rendering=1

"Set j and k to go down a line even on a wrapped line
nmap j gj
nmap k gk

"Y yanks from cursor to end of line
nnoremap Y y$

" move the current line up and down
nnoremap <leader>k      :m-2<CR>==
nnoremap <leader>j      :m+1<CR>==

"Remove ^M characters visual studio likes to make
nnoremap <leader>dm		:%s/\r\(\n\)/\1/g<CR>``


" move the word under the cursor left and right
nnoremap <leader>h       "_yiw?\v\w+\_W+%#<CR>:s/\v(%#\w+)(\_W+)(\w+)/\3\2\1/<CR><C-o><C-l>:noh<CR>
nnoremap <leader>l       "_yiw:s/\v(%#\w+)(\_W+)(\w+)/\3\2\1/<CR><C-o>/\v\w+\_W+<CR><C-l>:noh<CR>

" isolate a line
nnoremap <leader><space><space> O<c-o>j<c-o>o<c-o>k<esc>

"Bracket out a line
nnoremap <leader>{ O{<esc>jo}<esc>

"copy/paste to os clipboard
vnoremap <Leader>y "*y
nnoremap <Leader>y "*y
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p
nnoremap <Leader>P "*P
vnoremap <Leader>P "*P
nnoremap <Leader>d "*d
vnoremap <Leader>d "*d
nnoremap <Leader>D "*D

"Paste in visual mode without overwriting the buffer
vnoremap p "_dp

"Quick file type changing
nnoremap <leader>ftj :set ft=javascript<CR>
nnoremap <leader>fth :set ft=html<CR>
nnoremap <leader>ftc :set ft=css<CR>
nnoremap <leader>ftx :set ft=xml<CR>
nnoremap <leader>fts :set ft=sql<CR>

"Break up html
vnoremap <leader>br mt:s/<[^>]*>/\r&\r/g<CR>`tdd=atvat:g/^$/d<CR>:noh<CR>}ddkvato<Esc>

"Format JSON
nnoremap <Leader>fj :%!python -m json.tool<CR>
nnoremap <leader>fx :set filetype=xml<cr>:%s/</\r</g<CR>:%s/>/>\r/g<CR>:g/^$/d<CR>gg=G

"Split up HTML tag and put cursor inside
imap <S-Enter> <Enter><Esc>O

"HTML attribute text object
omap aha :normal vaha<CR>
vnoremap aha :<C-U>silent! normal! vf";<CR>


"turn off ~ file backup
set nobackup

autocmd! BufWritePost .vimrc source $MYVIMRC

"Fix closetag
"let g:closetag_html_style=1
"au Filetype html,xml,xsl source ~/.vim/vim73/scripts/closetag.vim

"For some reason I have to manually load the css color script
au Filetype html,css source ~\.vim\vim73\after\syntax\css.vim

"Ctrl-P stuff
nnoremap <silent> <c-b> :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 'c'

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|swo|swp)$'

"Gets a bunch of lines ready to be inserted into a table in sql
nnoremap  <leader>sql :call Sql()<cr>

"Macro for splitting up sql inserts when you have over 1,000 records. Used in
"the Sql() function
let @s = '0xOinsert into ##SomeTable valuesjj1001j0'

"Make empty lines ACTUALLY empty (no whitespace)
nmap <leader>dws :%s/^\s*$//g<CR>:noh<cr>``
"Delete empty lines
nmap <leader>dbl :g/^$/d<cr>``

"Fixes brace matching in script tags inside HTML files
let b:match_debug=1

"For vim-airline
set laststatus=2
imap jj <esc>
imap jk <esc>

"BetterDigraphs
inoremap <expr>  <C-K>   BDG_GetDigraph()

"Vimath
vmap ++ y:call VMATH_Analyse()<cr>
nmap ++ vip++

ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

nnoremap yat yVat``

"NerdTree stuff
map <F2> :NERDTreeToggle<CR>
map <Leader>nt :NERDTree c:/users/ian.witherow/copy/projects/webdev<CR>

"Undotree
nnoremap <F5> :UndotreeToggle<cr>

function! Sql()
	call inputsave()
	let tableName = input('Table name: ')
	call inputrestore() 

	silent

	if tableName == ""
		echo "Aborted"
		return
	endif

	let tableField = ""

	call inputsave()
	let createTable = input('Create table? (y/n): ')
	call inputrestore() 
	if createTable == "y"
		call inputsave()
		let tableField = input('Field name: ')
		call inputrestore() 
	endif

	silent :execute "set filetype=sql"

	"Remove blank lines
	silent :execute ":g/^$/d"

	silent :execute "%s/^/,('/g"
	silent :execute "%s/$/')/g"
	silent :execute "noh"
	silent :execute "normal! gg"
	let timeout = 5
	let current = 0

	"Command to write the insert sql statement. Go to beginning of line,
	"delete the comma, insert new line above, write insert statement.
	"Finally, go 1001 lines down since SQL inserts cap at 1000
	let insertSql = 'normal 0xOinsert into ' . tableName . ' valuesjj1001j0'

	silent :execute insertSql
	let curline = line('.')
	if curline != line('$')
		while curline + 1 != line('$') && curline != line('$')
			let current += 1
			let curline = line('.')
			if curline != line('$')
				silent :execute insertSql
			endif
		endwhile
	endif

	if tableField != ""
		:execute "normal! gg"
		let sql = "create table " . tableName . " (". tableField ." varchar(500))"
		:execute "normal! O"
		call setline('.', sql)
	endif

	:execute "normal! gg"
	normal! "*yG
endfunction
