set number                         " Line numbers
set linebreak                      " Break line without break word
set nobackup                       " Dont save backup~ files
set ignorecase                     " Ignore case when searching
set smartcase                      " Override ignorecase when pattern contains a capital letter
set incsearch                      " Find results as you type
set ai                             " Autoindent
set backspace=indent,eol,start     " Visual studio backspace thing for the extensiont
set shiftwidth=3 tabstop=3         " Uses less real estate than 4
set noexpandtab                    " Don't use spaces
set guioptions-=m                  " Remove menu
set guioptions-=T                  " Remove toolbar
set guioptions-=r                  " Remove scroll bar
set directory=~/.vim/swp           " Put .swp files here
set nrformats=                     " Treat all numbers as decimal
set lazyredraw                     " When running macros, wait until it's done and then update the screen. way fasterw
set noshowmatch
set hidden                         " Allow switching buffers even if it's not saved yet
set rnu									  " relative line numbers
set guifont=consolas:h10

"Syntax highlighting
syntax on

colorscheme codeschool


"Vundle stuff
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'arecarn/crunch'
Plugin 'kien/ctrlp.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'docunext/closetag.vim'
Plugin 'atweiden/vim-betterdigraphs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mjbrownie/swapit'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bkad/CamelCaseMotion' "use ,<motion> to move in camelcase
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdtree' "File browsing
Plugin 'ervandew/supertab' "tab completion in insert mode
Plugin 'atweiden/vim-vmath' "Lets you do ++ to math some numbers
Plugin 'mattn/emmet-vim' "New zen-coding
Plugin 'godlygeek/tabular'
Bundle 'tpope/vim-markdown'
"Bundle 'pangloss/vim-javascript'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/MatchTag'
Plugin 'kana/vim-textobj-user'
Plugin 'tpope/vim-speeddating'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'taku-o/vim-toggle'
Plugin 'krisajenkins/dbext.vim'
Plugin 'krisajenkins/vim-pipe'
Plugin 'vim-scripts/SQLComplete.vim'
call vundle#end()
filetype plugin indent on


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



"" Use pathogen to load plugins from bundle directory
"filetype off
"call pathogen#incubate()
"call pathogen#helptags()
"filetype plugin indent on

"ASP.NET files that should act like HTML
au BufNewFile,BufRead *.aspx,*.ascx,*.master set filetype=html

"Start in full screen
au GUIEnter * simalt ~x

"Allows % to move between braces in inline css
au filetype html let b:match_debug=1

"Fixes brace matching in script tags inside HTML files
"let b:match_debug=1

"Load .vimrc after saving it
au! BufWritePost .vimrc source $MYVIMRC

"turn off stupid bell sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500


let mapleader=','

"_____________________________________________________
"----------------------Mappings-----------------------
"_____________________________________________________

"jj and jk exit insert mode
imap jj <esc>
imap jk <esc>

"Have 0 go to first nonblank character
nmap 0 ^

"Space centers the screen
nmap <space> zz

"Double ESC turns off seach highlighting
nmap <silent> <ESC><ESC> :noh<CR>

"Ctrl-L unhighlights as well as redraws the screen
nnoremap <silent> <c-l> :noh<cr><c-l>

"New lines while staying in normal mode
nmap <Enter> o<Esc>
nmap <S-Enter> O<Esc>

"Set j and k to go down a line even on a wrapped line
nmap j gj
nmap k gk

"Make empty lines ACTUALLY empty (removes lines with just whitespace)
nmap <leader>dws :%s/^\s*$//g<CR>:noh<cr>``

"Delete empty lines
nmap <leader>dbl :g/^$/d<cr>``

"Vimath plugin - does some math stuff on lists of numbers
vmap ++ y:call VMATH_Analyse()<cr>
nmap ++ vip++

"Open a new tab
nmap <leader>tn :tabnew<CR>

"Easy VIMRC editing
map <leader>rc :edit $MYVIMRC<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>

"Open current file location in windows explorer
map <leader>ex :silent ! "explorer /select, %<cr>"

"Get rid of those annoying underlines in HTML
let html_no_rendering=1


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

"copy/paste to os clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>P "+P
nnoremap <Leader>d "+d
vnoremap <Leader>d "+d
nnoremap <Leader>D "+D

"Paste in visual mode without overwriting the buffer
vnoremap p "_dp
vnoremap P "_dP

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

"Split up HTML tag and put cursor inside (Used when cursor is like this: <div>|</div>)
imap <S-Enter> <Enter><Esc>O

"HTML attribute text object
omap aha :normal vaha<CR>
vnoremap aha :<C-U>silent! normal! vf";<CR>


"Copy the entire lines when grabbing html tags
nnoremap yat yVat``

"Persist undo
set undodir=~/.vim/vimundo
set undofile
set undolevels=5000


runtime macros/matchit.vim


"Ctrl-P stuff
"Ctrl+B opens CtrlP Buffer
nnoremap <silent> <c-b> :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 'c'

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|\v[\/]\.(git|hg|svn|swo|swp)$'

"Gets a bunch of lines ready to be inserted into a table in sql
nnoremap  <leader>sql :call Sql()<cr>

"Generates VB public properties from private ones
let @v = 'mmyyGpcePublic Propertyjkf_xAGet€ýc€ýbEnd Getjk>>O	Return _jk?properwye/_pjoSetEnd Setjk>>O	_" = valuejkkA(value asjk?properwwwy$/as)ea "jkjjo€kbEnd Propertyjk`mj'

"Macro for splitting up sql inserts when you have over 1,000 records. Used in
"the Sql() function
let @s = '0xOinsert into ##SomeTable valuesjj1001j0'


"For vim-airline
let g:airline#extensions#tabline#show_buffers=1
set laststatus=2

"BetterDigraphs
inoremap <expr>  <C-K>   BDG_GetDigraph()

"NerdTree stuff
map <F2> :NERDTreeToggle<CR>

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
	normal! "+yG
endfunction
