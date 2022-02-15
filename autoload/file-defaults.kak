
# Set defaults for golang
hook global WinSetOption filetype=go %{
    set-option buffer indentwidth 0
    set-option buffer aligntab true
}

# Set defaults for c
hook global WinSetOption filetype=(c|cpp|objc) %{
    set-option buffer indentwidth 2
}

hook global WinSetOption filetype=rust %{
    hook window -group rust-inlay-hints BufReload .* rust-analyzer-inlay-hints
    hook window -group rust-inlay-hints NormalIdle .* rust-analyzer-inlay-hints
    hook window -group rust-inlay-hints InsertIdle .* rust-analyzer-inlay-hints
    hook -once -always window WinSetOption filetype=.* %{
        remove-hooks window rust-inlay-hints
    }
}

hook global WinSetOption filetype=man %{
    hook buffer goto-ref
}
