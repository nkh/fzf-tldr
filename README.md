# NAME

    fzf-tldr - an unorthodox tldr/snippet client

# SYNOPSIS

    fzf-tldr [command_query]

# DESCRIPTION

A non-conformist tldr. Look in the **See Also** section below if you want a polished client.

As the names hints, **fzf-tldr** uses, the outstanding, fzf to do some of the work.

What makes it different from other tldr client?

- tldr pages are neither downloaded nor update automatically
    - you can use git for updates, which is much faster than other clients (remember to clone shallow)
- custom pages
- multi-line examples
- placeholders are edited in vim, with gratitude to Bram Moolenaar
- user defined color

*fzf-tldr* uses a three stage process
- select a command
- select one or more examples
- modify the example in vim if the examples contain placeholders

The result is output on stdout. 

## Select a command from the tldr and custom pages

![UI](https://github.com/nkh/fzf-tldr/blob/main/media/commands.png)

## Select an example

![UI](https://github.com/nkh/fzf-tldr/blob/main/media/examples.png)

## Modify the placeholders

![UI](https://github.com/nkh/fzf-tldr/blob/main/media/edit.png)

# Vim INTEGRATION

Examples containing placeholders are opened in vim.

The placeholders will be highlighted.

Optionally adding the following code to your *.vimrc* will:
- source the fzf-tldr vimscript
- bind "F3", or any key you like, to TldrFixall

```
" fzf-tldr ------------------------------------------------------

source $REPO_PATH/fzf-tldr.vim

au BufRead,BufNewFile *.tldr set filetype=tldr
autocmd FileType tldr nnoremap <buffer> <F3> :TldrFixAll<CR>

"optional TldrNext, find next placeholder
"optional TldrFix,  fix the placeholder under cursor
```

## TldrFixAll

A vimscript which will fin all the placeholders and ask for a replacement string.

If the placeholder is found multiple times, all occurrences will be replaced in interactive mode; press y/n/a/q as usual in vim. 

# CONFIGURATION

In ***$HOME/.config/fzf-tldr***

```
# minimu config: one of the page locations

# location for custom tldr pages
CUSTOM_PAGES='/home/.../custom_tldr/'

# multiple locations for tldr pages
TLDR_PAGES='/home/.../tldr/pages/linux /home/.../tldr/pages/common/'

# colors
HEADER_COLOR=37
COMMENT_COLOR=34
OPTION_COLOR=33
PLACEHOLDER_COLOR='1;43'
```

# INSTALL

*fzf-tldr* consists of these files:
- $HOME/.config/fzf-tldr, see # CONFIGURATION above
- fzf-tldr, to be copied in your path
- color_tldr, to be copied in your path
    - this can be used to color or flatten the tldr/custom pages without using fzf-tldr

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
