                                         "  _______________________________OG_______________________________
set nocompatible                         "  system-wide vimrc
set backspace=indent,eol,start           "  backspace over indentation, etc
set ruler                                "  always show cursor position
set splitright                           "  default split right
"set relativenumber                       "  show relative line number of left
"set number                               "  show current line number at cursor
set cursorline                           "  line at cursor row
set incsearch                            "  incremental search for partial /
set hlsearch                             "  search highlighting /
set showcmd                              "  show command on bottom
set autoread                             "  reread files if unmodified
set autoindent                           "  new line inherits indent
set expandtab                            "  tabs to spaces
set tabstop=2
set softtabstop=2 
set shiftwidth=2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip "  ignore these types of files
set history=1000                         "  increase undo limit
set nowrap                               "  disable auto wrap
set hidden                               "  save previous buffer stuff
                                         "" set path=$PWD/** "makes current vim path relative
set ignorecase                           "  ignore case for search
set smartcase                            "  automatically convert search to uppercase
set noswapfile                           "  disable swap files
set tags=tags;/                          "  tags
set t_Co=256
set background=dark
set clipboard^=unnamed,unnamedplus       "  use system clipboard
set scrolloff=10                         "  lines of buffer between top and bottom
set ttimeout
set ttimeoutlen=0
set timeoutlen=1000                       "  time in between commands v,c
syntax enable                            "  colors, overrule with on

set termguicolors
let &t_ZH='\e[3m'                        "  italics
let &t_ZR='\e[23m'                       "  italics
highlight Comment cterm=italic
colo iceberg                             "  current color theme



set number relativenumber
augroup numbertoggle "only use relativenumber on current window
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  "autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set numberwidth=2
highlight LineNr guibg=NONE
highlight clear CursorLineNR
highlight clear SignColumn
highlight clear LineNr
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=NONE guibg=NONE














"  auto read when leaving window
au FocusLost,WinLeave * :silent! noautocmd w 
au FocusGained,BufEnter * :checktime
au CursorHold,CursorHoldI * checktime




"  _______________________________TEXT EDITING_______________________________

" default 
  map <Space> <Leader>
  let mapleader = "\<Space>"
  " lazybois remap ; to :, it's fine cause w/ clever-f you can just repeat f
  :nmap ; :


" nav
  nnoremap J 5j
  nnoremap K 5k
  noremap vA ggVG

" text editing
  map <leader>/ <Plug>NERDCommenterToggle
  " delete entire line
  nnoremap X yydd
  " don't overwrite register
  noremap d "_d
  noremap dd "_dd
  noremap D "_D
  noremap c "_c
  noremap cc "_cc
  noremap C "_C
  " ctrl backspace to delete word?
  imap <C-BS> <C-W>
  " duplicate
  noremap du Yp
  vnoremap du yp

" undo
  noremap U <C-r><CR>





"  _______________________________PLUGS_______________________________
"  :PlugInstall, :PlugClean

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/autoload')

" file search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

" text search
  Plug 'jremmen/vim-ripgrep'
  Plug 'mileszs/ack.vim'
  Plug 'epmatsw/ag.vim'

" tmux navigation
  Plug 'christoomey/vim-tmux-navigator'
  " default home screen
  Plug 'mhinz/vim-startify'
    let g:startify_files_number = 15
 
" syntax
  Plug 'tpope/vim-sensible'
  " deletes around ) , etc
  Plug 'wellle/targets.vim'
  " keep pressing f for find
  Plug 'rhysd/clever-f.vim'
    let g:clever_f_across_no_line = 1
  " automatically closes quotes
  Plug 'tmsvg/pear-tree'
    let g:pear_tree_repeatable_expand = 0
    let g:pear_tree_smart_backspace   = 1
    let g:pear_tree_smart_closers     = 1
    let g:pear_tree_smart_openers     = 1
  " <leader + /> to comment
  Plug 'scrooloose/nerdcommenter'
  " multiple cursor w/ <C-n>
  Plug 'terryma/vim-multiple-cursors'
  " easily add/remove parents
  Plug 'tpope/vim-surround'
  " extend repeat commands
  Plug 'tpope/vim-repeat'
  " autoindent stuff, visual-mode, ga + <align-by>
  Plug 'junegunn/vim-easy-align'
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)



" git gud
  Plug 'tpope/vim-fugitive'
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    set diffopt+=vertical "make diff vertical split
  Plug 'mhinz/vim-signify'
     set updatetime=100
     let g:signify_line_highlight = 1
     highlight SignifyLineAdd ctermfg=Black ctermbg=Black guibg=#226823
     highlight SignifyLineChange ctermfg=Black ctermbg=DarkYellow guibg=#685a22
     highlight SignifyLineDelete ctermfg=Black ctermbg=DarkRed guibg=#682b22

" language
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'othree/html5.vim'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'hynek/vim-python-pep8-indent'
  Plug 'mxw/vim-jsx'

" theme
  Plug 'cocopon/iceberg.vim'

  "Plug 'junegunn/seoul256.vim'

  "Plug 'nightsense/snow'
  "colo seoul256
  "let g:seoul256_background = 234
  "set background=dark

  "Plug 'nightsense/snow'
  "colorscheme snow

  "Plug 'nightsense/stellarized'
  "colo stellarized

  "Plug 'chriskempson/base16-vim'
  "let base16colorspace=256
  "colorscheme base16-default-dark


  "Plug 'nanotech/jellybeans.vim'
  "colorscheme jellybeans

  "Plug 'joshdick/onedark.vim'
  "colorscheme onedark

  "Plug 'huyvohcmc/atlas.vim'
  "colorscheme atlas

  "Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  "colorscheme challenger_deep





 
call plug#end()




"  _______________________________FILE NAVIGATION_______________________________
" :Explore, file navigation
  let g:netrw_liststyle = 3      " tree structure
  let g:netrw_banner = 0         " remove banner
  let g:netrw_browse_split = 2   " default open vertical split
  let g:netrw_winsize = 25       " explorer width
  let g:netrw_keepdir = 0
  let g:ag_working_path_mode="r" " ag stuff

  "  turn off quickfix (annoying thing on bottom of screen) w/ <Leader + c> 
  nnoremap <silent> <Leader>c :call QuickFix_toggle()<CR>
  function! QuickFix_toggle()
      for i in range(1, winnr('$'))
          let bnum = winbufnr(i)
          if getbufvar(bnum, '&buftype') == 'quickfix'
              cclose
              return
          endif
      endfor
      copen
  endfunction





"  _______________________________FILE SEARCH_______________________________
" Rg ripgrep search
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

" RG full screen
  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction




"  _______________________________GENERAL REMAP_______________________________
" search
  cnoreabbrev rg Rg
  cnoreabbrev files GFiles
  cnoreabbrev f GFiles
  nnoremap <silent> <C-f> :GFiles<CR>
  " open new search for selected word
  map <leader>f :rg <c-r>=expand("<cword>")<cr><cr>
  " go to definition
  nnoremap <leader>d :vsplit<CR>:exec("tag ".expand("<cword>"))<CR>


" general
  nmap <Leader>b :Buffers<CR>
  nmap <Leader>h :History<CR>
  nnoremap <leader>w :w<CR>
  " should open :History  in FZF
  cnoreabbrev Q :browse oldfiles 
  command! FZFMru call fzf#run({
  \  'source':  v:oldfiles,
  \  'sink':    'e',
  \  'options': '-m -x +s',
  \  'down':    '40%'})
  cnoreabbrev QQ :History
  cnoreabbrev tree :Explore
  cnoreabbrev b :Buffers
  cnoreabbrev b :Buffers
  cnoreabbrev .. cd ..

" source / edit
  " source vimrc
  cnoreabbrev sv :source $MYVIMRC<CR>         
  " ag stuff
  cnoreabbrev ve :vsplit $MYVIMRC<CR>         
  " edit ~/.zshrc
  cnoreabbrev ze :vsplit ~/.zshrc<CR>         
  " edit ~/.tc_settings
  cnoreabbrev te :vsplit ~/.tc_settings<CR>   
  " edit notes w/ new line on bottom
  cnoreabbrev n :vsplit ~/notes.md<CR>Go<CR>  

  " Source vim configuration file whenever it is saved
  if has ('autocmd')          " Remain compatible with earlier versions
   augroup Reload_Vimrc       " Group name.  Always use a unique name!
      autocmd!
      autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
      autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
    augroup END
  endif " has autocmd


" buffers
  cnoreabbrev save :SSave
  cnoreabbrev load :SLoad
  cnoreabbrev delete :SDelete
  "yank relative buffer path
  nnoremap <Leader>yp :let @+=expand("%")<CR> 
  " Copy current file path to clipboard
  nnoremap <leader>% :call CopyCurrentFilePath()<CR>
  function! CopyCurrentFilePath()
    let @+ = expand('%')
    echo @+
  endfunction


" insert move autocomplete
  imap bp binding.pry
  imap bpp <%= binding.pry %>



"_______________________________ BUFFER / WINDOW

" GRAVEYARD
"buffer from top and bottom of screen
"jumping with H,L
"function! JumpWithScrollOff(key) " {{{
  "set scrolloff=0
  "execute 'normal! ' . a:key
  "set scrolloff=999
"endfunction " }}}
"nnoremap H :call JumpWithScrollOff('H')<CR>
"nnoremap L :call JumpWithScrollOff('L')<CR>



"open buffer
nnoremap <leader>b :ls<cr>:b<space>
nnoremap <leader>v :ls<cr>:vsp<space>\|<space>b<space>
nnoremap <leader>s :ls<cr>:sp<space>\|<space>b<space>
nnoremap <leader>o :only

"resize window
nnoremap <silent> <Leader>> 20<C-w>>
nnoremap <silent> <Leader>< 20<C-w><
nnoremap <silent> <Leader>= <C-w>=


" Switch between tabs
"nmap <leader>1 1gt
"nmap <leader>2 2gt
"nmap <leader>3 3gt
"nmap <leader>4 4gt
"nmap <leader>5 5gt
"nmap <leader>6 6gt
"nmap <leader>7 7gt
"nmap <leader>8 8gt
"nmap <leader>9 9gt

" Switch between windows
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile
" go back to previously selected window
nnoremap <Leader>0 <c-w><c-p>

" put window # in status line
"set statusline+=%{WindowNumber()}
function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

set statusline=%{WindowNumber()}\ %f\ %h%w%m%r%=%-14.(%l,%c%V%)\ %P

"set statusline=\ %{WindowNumber()}\ %t 

" add Switch between buffers w/ !@#$%^&*()

" Creating splits with empty buffers in all directions
nnoremap <Leader>hn :leftabove  vnew<CR>
nnoremap <Leader>ln :rightbelow vnew<CR>
nnoremap <Leader>kn :leftabove  new<CR>
nnoremap <Leader>jn :rightbelow new<CR>

nnoremap <Leader>HH :leftabove  vnew<CR>:Rg<CR>
nnoremap <Leader>LL :rightbelow vnew<CR>:Rg<CR>
nnoremap <Leader>KK :leftabove  new<CR>:Rg<CR>
nnoremap <Leader>JJ :rightbelow new<CR>:Rg<CR>

nnoremap <Leader>H<Space>  :leftabove  vnew<CR>:Rg<CR>
nnoremap <Leader>L<Space>  :rightbelow vnew<CR>:Rg<CR>
nnoremap <Leader>K<Space>  :leftabove  new<CR>:Rg<CR>
nnoremap <Leader>J<Space>  :rightbelow new<CR>:Rg<CR>

nnoremap <silent> <Leader>hh :call JumpOrOpenNewSplit('h', ':leftabove vnew', 0)<CR>
nnoremap <silent> <Leader>ll :call JumpOrOpenNewSplit('l', ':rightbelow vnew', 0)<CR>
nnoremap <silent> <Leader>kk :call JumpOrOpenNewSplit('k', ':leftabove vnew', 0)<CR>
nnoremap <silent> <Leader>jj :call JumpOrOpenNewSplit('j', ':rightbelow vnew', 0)<CR>

nnoremap <silent> <Leader>h<Space> :call JumpOrOpenNewSplit('h', ':leftabove vsplit', 1)<CR>
nnoremap <silent> <Leader>l<Space> :call JumpOrOpenNewSplit('l', ':rightbelow vsplit', 1)<CR>
nnoremap <silent> <Leader>k<Space> :call JumpOrOpenNewSplit('k', ':leftabove split', 1)<CR>
nnoremap <silent> <Leader>j<Space> :call JumpOrOpenNewSplit('j', ':rightbelow split', 1)<CR>

" If split in given direction exists - jump, else create new split
function! JumpOrOpenNewSplit(key, cmd, fzf) " {{{
  let current_window = winnr()
  execute 'wincmd' a:key
  if current_window == winnr()
    execute a:cmd
    if a:fzf
      Files
    else
      Rg
    endif
  else
    if a:fzf
      Files
    else
      Rg
    endif
  endif
endfunction " }}}



"ADD LEADER L F to CREATE NEW FIND WINDOW
