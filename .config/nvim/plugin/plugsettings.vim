" FZF
let $FZF_DEFAULT_OPTS="--reverse"
if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif
nmap <Leader>f :Files ~/<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>g :GFiles<CR>
nmap <Leader>c :Commands<CR>
nmap <Leader>h :History<CR>
if executable('rg') " use rg by default
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
endif
let g:fzf_colors =
\ { 'fg':         ['fg', 'Normal'],
  \ 'bg':         ['bg', 'Normal'],
  \ 'preview-bg': ['bg', 'NormalFloat'],
  \ 'hl':         ['fg', 'Comment'],
  \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':        ['fg', 'Statement'],
  \ 'info':       ['fg', 'PreProc'],
  \ 'border':     ['fg', 'Ignore'],
  \ 'prompt':     ['fg', 'Conditional'],
  \ 'pointer':    ['fg', 'Exception'],
  \ 'marker':     ['fg', 'Keyword'],
  \ 'spinner':    ['fg', 'Label'],
  \ 'header':     ['fg', 'Comment'] }

" NNN
let g:nnn#set_default_mappings = 0
nnoremap <C-n> :NnnPicker %:p:h<CR>
nnoremap <C-e> :NnnPicker %:p:h<CR>
let g:nnn#replace_netrw = 1
let g:nnn#command = 'nnn -cHT v'
let g:nnn#layout = { 'window': { 'width': 0.7, 'height': 0.8, 'highlight': 'Debug' } }
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

" Tmux integration
let g:tmux_resizer_no_mappings = 0

" VimWiki
let g:vimwiki_list = [{'path': '~/Nextcloud/Notes/vimwiki'}]

" Comment on/off
" let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1
" let g:NERDDefaultAlign = 'left'
" let g:NERDTrimTrailingWhitespace = 1
" let g:NERDToggleCheckAllLines = 1

" setup mapping to call :LazyGit
nnoremap <silent> <leader>lg :LazyGit<CR>

" MarkdownPreview
nnoremap <Leader>m :MarkdownPreview<CR>

" Supersudo
let g:suda_smart_edit = 1

" Remove whitespace
" let g:better_whitespace_enabled=1
" let g:strip_whitespace_on_save=1

" ansible-vim
" If you want to override the default file type detection you can easily do this in your .vimrc.
" For example if you use YAML syntax for hosts include something like this:
augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
augroup END
