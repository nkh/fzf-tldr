# NAME

    fzf-tldr - convenience frontend to tldr

# SYNOPSIS

    fzf-tldr

# DESCRIPTION

***Work in progress***, check the Todo.


## Chose a command from the tldr commands

![UI](https://github.com/nkh/fzf-tldr/blob/main/media/commands.png)

## Chose an example for the command

![UI](https://github.com/nkh/fzf-tldr/blob/main/media/examples.png)

## Modify the placeholders

![UI](https://github.com/nkh/fzf-tldr/blob/main/media/edit.png)

# Vim INTEGRATION

Adding the following code to your *.vimrc* will:
- source fzf-tldr functions
- add "F3" binding which moves to the next placeholder
- add "F6" binding which move to the next placeholder, delete it and start insert mode


```
" fzf-tldr ------------------------------------------------------

source $REPO_PATH/fzf-tldr.vim

au BufRead,BufNewFile *.tldr set filetype=tldr
autocmd FileType tldr nnoremap <buffer> <F3> :TldrNext<CR>
autocmd FileType tldr nnoremap <buffer> <F6> :TldrFix<CR>
```

# CONFIGURATION

Right now, nothing is configurable, except if you hack the short code, and it's a "works for me" kind of code.

# DEPENDENCIES

- Perl
- Tealdeer
- FZF
- Vim

# SEE ALSO 

[intelli-shell](https://github.com/lasantosr/intelli-shell)

# AUTHORS

    Khemir Nadim ibn Hamouda
    https://github.com/nkh
    CPAN ID: NKH

# LICENCE

© Nadim Khemir 2023, Artistic licence 2.0
