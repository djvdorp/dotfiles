" Vim config

" Plug
    " Setting up Plug - A minimalist Vim plugin manager
        if empty(glob('~/.vim/autoload/plug.vim'))
            silent !curl -sfLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall | source ~/.vimrc
        endif
        set nocompatible              " be iMproved, required
        call plug#begin('~/.vim/plugged')
    " Setting up Plug end
        " General Vim
            Plug 'tpope/vim-sensible'
            Plug 'tpope/vim-fugitive'
            Plug 'airblade/vim-gitgutter'
            Plug 'tpope/vim-surround'
            Plug 'tpope/vim-abolish'
            Plug 'tpope/vim-dispatch'
            Plug 'wincent/command-t', { 'do': 'cd ~/.vim/plugged/command-t/ruby/command-t/ext/command-t/ && ruby extconf.rb && make' } "Post install hooks
            Plug 'vim-airline/vim-airline'
            Plug 'vim-airline/vim-airline-themes'
            Plug 'scrooloose/syntastic'
            Plug 'Valloric/YouCompleteMe', { 'do' : '~/.vim/plugged/YouCompleteMe/install.py --gocode-completer' } "Post install hooks
        " General Vim end

        " Color Schemes
            Plug 'chriskempson/vim-tomorrow-theme'
            Plug 'altercation/vim-colors-solarized'
            Plug 'chriskempson/base16-vim'
            Plug 'fatih/molokai'
        " Color Schemes end

        " Python
            "YouCompleteMe got me covered
            Plug 'jmcantrell/vim-virtualenv', { 'for': ['python', 'markdown'] }
        " Python end

        " Go
            Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for' : ['go', 'markdown'] } "Loads only when editing golang files
        " Go end

        " Misc
            Plug 'Glench/Vim-Jinja2-Syntax', { 'for': ['jinja', 'jinja2']}
            Plug 'vim-scripts/nginx.vim', { 'for': ['nginx', 'markdown'] }
            Plug 'tmux-plugins/vim-tmux', { 'for': ['tmux', 'markdown'] }
            Plug 'pearofducks/ansible-vim', { 'for' : ['yaml', 'ansible', 'markdown'] }
            Plug 'docker/docker' , {'rtp': 'contrib/syntax/vim/'}
            Plug 'junkblocker/patchreview-vim', { 'on': ['CodeReview']}
            Plug 'codegram/vim-codereview', { 'on': ['CodeReview']}
        " Misc end
    " Plugs end

" Plug end

" Vim Plug Configs
    " Airline
    let g:airline_enable_syntastic          = 1
    let g:airline_detect_modified           = 1
    let g:airline_detect_paste              = 1
    let g:airline_enable_fugitive           = 1
    let g:airline_left_sep                  = ''
    let g:airline_right_sep                 = ''
    " Clearly this only works with airline enabled with powerline fonts
    let g:airline_powerline_fonts           = 1
    " Syntastic
    let g:syntastic_check_on_open           = 1
    let g:syntastic_go_checkers             = ['golint', 'govet', 'errcheck']
    let g:syntastic_javascript_checkers     = ['jshint']
    let g:syntastic_mode_map                = { 'mode': 'active', 'passive_filetypes': ['go'] }
    let g:syntastic_python_checkers         = ['flake8']
    " Vim-go
    let g:go_fmt_command                    = "goimports"
    let g:go_highlight_functions            = 1
    let g:go_highlight_methods              = 1
    let g:go_highlight_fields               = 1
    let g:go_highlight_types                = 1
    let g:go_highlight_operators            = 1
    let g:go_highlight_build_constraints    = 1
    let g:go_list_type                      = "quickfix"

    " Activate Plug
    call plug#end()
    " Activate Plug end
" Vim Plug Configs end

" Set Vim defaults
    syntax on

    " No swap files next to original file
    set dir=~/.cache/vim-swap

    set expandtab
    set shiftwidth=4
    set tabstop=4
    set number
    set incsearch
    set cursorline
    set background=dark
    set mousehide
    set history=10000
    set showmatch
    set fileformat=unix
    set autoindent
    set smartindent
    set autowrite
    " Always show statusline
    set laststatus=2
    " Use 256 colours (Use this setting only if your terminal supports 256 colours)
    set t_Co=256
    set term=xterm-256color
    " Always use UTF-8
    set encoding=utf-8
    set termencoding=utf-8

    filetype plugin indent on

    colorscheme molokai

    " Use F2 to toggle line numbers
    nnoremap <F2> :set nonumber!<CR>

    " Use F12 to toggle paste mode
    nnoremap <F12> :set invpaste paste?<CR>
    set pastetoggle=<F12>

    " Use , as leader
    let mapleader=','
    " Vim-fugutive
    map <leader>gd :Gdiff<CR>
    map <leader>gb :Gblame<CR>
    map <leader>gc :Gcommit<CR>
    map <leader>gs :Gstatus<CR>
    map <leader>gr :Gremove<CR>
    map <leader>gw :Gwrite<CR>
    " Vim-gitgutter
    map <leader>gn :GitGutterNextHunk<CR>
    map <leader>gp :GitGutterPrevHunk<CR>
    " Syntastic
    map <leader>e :SyntasticCheck<CR>:Errors<CR><C-W>j
    " Misc
    map <leader>= <C-W>=
    map <leader>w <C-W><C-O>
    map <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
    map <leader>h <C-W>h
    map <leader>j <C-W>j
    map <leader>k <C-W>k
    map <leader>l <C-W>l

    " run :GoBuild or :GoTestCompile based on the go file
    function! s:build_go_files()
      let l:file = expand('%')
      if l:file =~# '^\f\+_test\.go$'
        call go#cmd#Test(0, 1)
      elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
      endif
    endfunction

    " Vim-go
    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go nmap <leader>r  <Plug>(go-run)
    autocmd FileType go nmap <leader>n  <Plug>(go-test)
    autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

    if has('persistent_undo')
        set undofile
        set undodir=~/.cache/vim-undo
        set undolevels=1000
        set undoreload=10000
    endif

    highlight ExtraWhitespace ctermbg=red guibg=red ctermfg=white
    match ExtraWhitespace /\s\+$\| \+\ze\t\| [^\t]\zs\t\+\| ^\t*\zs \+\|\t/
" Set Vim defaults end
