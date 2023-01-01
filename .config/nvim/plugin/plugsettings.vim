" Tmux integration
let g:tmux_resizer_no_mappings = 0

" VimWiki
let g:vimwiki_list = [{'path': '~/Nextcloud/Notes/vimwiki'}]

" Supersudo
let g:suda_smart_edit = 1

" ansible-vim
" If you want to override the default file type detection you can easily do this in your .vimrc.
" For example if you use YAML syntax for hosts include something like this:
augroup ansible_vim_fthosts
  autocmd!
  autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
augroup END
