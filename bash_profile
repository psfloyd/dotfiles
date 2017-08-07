##PSF
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


# {{{ Environment Variables
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/Misc/bin" ] ; then
    PATH="$HOME/Misc/bin:$PATH"
fi
# }}}

