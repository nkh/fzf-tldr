# NAME

    fzf-tldr - unorthodox tldr client

# SYNOPSIS

    fzf-tldr

# DESCRIPTION

A tldr client which uses other tools to do the job.

If you want a polished client look into *See Also* below 

As the names hints, **fzf-tldr** uses, the outstanding, fzf to do some of the work.

What makes it unorthodox?

- tldr pages are neither downloaded nor update automatically
- you can use git for updates, which is much faster than other clients
- you can have custom pages, anywhere you want
- you can edit the chosen example in vim, with gratitude to Bram Moolenaar
- you can use colors you like, 

*fzf-tldr* uses a three stage process
- select a command
- select an example
- modify the example

The result is output on stdout. 

## Select a command from the tldr and custom pages

![UI](https://github.com/nkh/fzf-tldr/blob/main/media/commands.png)

## Select an example

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

In $HOME/.config/fzf-tldr

```
# location for you custom tldr pages
CUSTOM_PAGES='/home/.../custom_tldr/'

# multiple locations for the official tldr pages
TLDR_PAGES='/home/.../tldr/pages/linux /home/.../tldr/pages/common/'
```

# DEPENDENCIES

- Perl
- FZF
- Vim

# SEE ALSO 

[intelli-shell](https://github.com/lasantosr/intelli-shell)

[tealdeer](https://github.com/dbrgn/tealdeer)

# AUTHORS

    Khemir Nadim ibn Hamouda
    https://github.com/nkh
    CPAN ID: NKH

# LICENCE

© Nadim Khemir 2023, Artistic licence 2.0
