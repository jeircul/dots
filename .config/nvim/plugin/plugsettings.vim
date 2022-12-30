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

" Tmux integration
let g:tmux_resizer_no_mappings = 0

" VimWiki
let g:vimwiki_list = [{'path': '~/Nextcloud/Notes/vimwiki'}]

" setup mapping to call :LazyGit
nnoremap <silent> <leader>lg :LazyGit<CR>

" MarkdownPreview
nnoremap <Leader>m :MarkdownPreview<CR>

" Supersudo
let g:suda_smart_edit = 1

" ansible-vim
" If you want to override the default file type detection you can easily do this in your .vimrc.
" For example if you use YAML syntax for hosts include something like this:
augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
augroup END
