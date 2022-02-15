# editor.kak
# Define editor behavior
#

set-option global tabstop 4
set-option global indentwidth 4
set-option global aligntab false
set-option global autoreload yes
set-option global ui_options terminal_assistant=none

# Insert mode color change
# hook global ModeChange ".*:normal" %{
#     set-face buffer PrimaryCursor
# }
# hook global ModeChange ".*:insert" %{
#     set-face buffer PrimaryCursorEol
# }

# Fat Fingers
alias global W write
alias global Q quit
alias global WQ write-quit
alias global wQ write-quit
alias global Wq write-quit
alias global W! write!
alias global Q! quit!
alias global WQ! write-quit!
alias global wQ! write-quit!
alias global Wq! write-quit!
# Remap goto
#map -docstring 'buffer top' global goto G g
#map global goto K k
#map global goto L l
#map global goto H h
#map global goto I i
#map global goto J j
#map global goto E e
#map global goto T t
#map global goto B b
#map global goto C c
#map global goto A a
#map global goto F f

# ctags
#hook global KakBegin .* %{
#    evaluate-commands %sh{
#        path=`git rev-parse --show-toplevel`
#        cd "$path"
#        if [ -e "./.tags" ]; then
#            printf "%s\n" "set-option -add current ctagsfiles %{$path/.tags}"
#        fi
#    }
#    ctags-enable-autoinfo
#    ctags-enable-autocomplete
#}

# Indentation stuff
hook global WinSetOption filetype=python %{
    set-option buffer indentwidth 4
}

hook global BufSetOption filetype=cpp %{
    set-option buffer indentwidth 2
}
hook global BufSetOption filetype=c %{
    set-option buffer indentwidth 2
}


# Lsp
eval %sh{kak-lsp --kakoune -s $kak_session}  # Not needed if you load it with plug.kak.
hook global WinSetOption filetype=(rust|python|go|javascript|typescript|c|cpp) %{
    lsp-enable-window
    lsp-auto-hover-enable
    set global lsp_auto_highlight_references true
}

