hook global BufCreate .*\.elv %{
    set-option buffer filetype elvish
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=elvish %{
    require-module elvish

    # cleanup trailing whitespaces when exiting insert mode
    hook window ModeChange pop:insert:.* -group elvish-trim-indent %{ try %{ execute-keys -draft <a-x>s^\h+$<ret>d } }
    hook window InsertChar \n -group elvish-indent elvish-indent-on-new-line
    hook window InsertChar \{ -group elvish-indent elvish-indent-on-opening-curly-brace
    hook window InsertChar \} -group elvish-indent elvish-indent-on-closing-curly-brace

    set-option buffer indentwidth 2
    set-option -add buffer extra_word_chars '-'

    hook -once -always window WinSetOption filetype=.* %{ remove-hooks window elvish-.+ }
}

hook -group elvish-highlight global WinSetOption filetype=elvish %{
    add-highlighter window/elvish ref elvish
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/elvish }
}

provide-module elvish %§

add-highlighter shared/elvish regions
add-highlighter shared/elvish/code default-region group
add-highlighter shared/elvish/dstring region %{"} %{(?<!\\)(\\\\)*"} fill string
add-highlighter shared/elvish/sstring region %{'} %{(?<!\\)(\\\\)*'} fill string
add-highlighter shared/elvish/comment region %{#} $ fill comment

# Highlight function names
add-highlighter shared/elvish/code/ regex "fn\s+([a-zA-Z0-9\-_]+)\b" 1:function
add-highlighter shared/elvish/code/ regex "\b(all|assoc|base|bool|break|cd|chr|constantly|continue|count|deprecate|dir-history|dissoc|drop|each|eawk|echo|eq|eval|exec|exit|external|fail|fclose|float64|fopen|from-json|from-lines|-gc|get-env|has-env|has-external|has-key|has-prefix|has-suffix|has-value|-ifaddrs|is|keys|kind-of|-log|make-map|nop|not|not-eq|ns|one|only-bytes|only-values|ord|order|path-*|peach|pipe|pprint|prclose|print|printf|put|pwclose|rand|randint|range|read-line|read-upto|repeat|repr|resolve|return|run-parallel|search-external|set-env|show|sleep|slurp|-source|src|-stack|styled|styled-segment|take|tilde-abbr|time|to-json|to-lines|to-string|unset-env|use-mod|wcswidth)\b" 1:function
add-highlighter shared/elvish/code/ regex "(\(|^\s*)([a-zA-Z0-9\-_]+)\b" 2:function

# Highlight Modules
add-highlighter shared/elvish/module region "(?<=use)\s" "($|(?=;))" fill module
add-highlighter shared/elvish/code/ regex "(\(|^|\b)(\w+):" 2:module

# Highlight Variables
add-highlighter shared/elvish/code/ regex "(?<=set)\s+([\w-]+)\s*=" 0:variable
add-highlighter shared/elvish/code/ regex "(\$[\w-]+)(\b|\(|\[)" 1:variable
add-highlighter shared/elvish/code/ regex "@\w+\b" 0:variable
add-highlighter shared/elvish/code/ regex "\b\w+\s*(?==)" 0:variable

# Highlight Control words
add-highlighter shared/elvish/code/ regex "\b(fn|if|elif|else|while|for|try|except|else|finally)\b" 1:keyword
add-highlighter shared/elvish/code/ regex "\b(use|var|set|del|and|or)\b" 1:builtin

# Highlight Literals
add-highlighter shared/elvish/code/ regex "\b\d+(?=[^a-zA-Z\-])" 0:value
add-highlighter shared/elvish/code/ regex "\b0x[0-9a-fa-f]+(?=[^a-zA-Z\-])" 0:value
add-highlighter shared/elvish/code/ regex "\b0o[0-7]+(?=[^a-zA-Z\-])" 0:value
add-highlighter shared/elvish/code/ regex "\b0b[01]+(?=[^a-zA-Z\-])" 0:value
add-highlighter shared/elvish/code/ regex "\b\d+\.\d+(?=[^a-zA-Z\-])" 0:value
add-highlighter shared/elvish/code/ regex "\b\d+(\.\d+)?e\d+(?=[^a-zA-Z\-])" 0:value

# Highlight barewords
#add-highlighter shared/elvish/code/ regex "\b[a-zA-Z0-9!%+,-./:@\\_]+\b" 0:string

#add-highlighter shared/elvish/code/ regex "(?<=fn)\s*\w+\b" 0:function
#add-highlighter shared/elvish/code/ regex "^\s+\w+\b" 0:function
#add-highlighter shared/elvish/code/ regex "(?<=\))\s*\w+\b" 0:function


# Commands
# ‾‾‾‾‾‾‾‾
define-command -hidden elvish-indent-on-new-line %~
    evaluate-commands -draft -itersel %=
        # preserve previous line indent
        try %{ execute-keys -draft <semicolon>K<a-&> }
        # indent after lines ending with { or (
        try %[ execute-keys -draft k<a-x> <a-k> [{(]\h*$ <ret> j<a-gt> ]
        # cleanup trailing white spaces on the previous line
        try %{ execute-keys -draft k<a-x> s \h+$ <ret>d }
        # align to opening paren of previous line
        try %{ execute-keys -draft [( <a-k> \A\([^\n]+\n[^\n]*\n?\z <ret> s \A\(\h*.|.\z <ret> '<a-;>' & }
        # copy // comments prefix
        try %{ execute-keys -draft <semicolon><c-s>k<a-x> s ^\h*\K/{2,} <ret> y<c-o>P<esc> }
        # indent after a switch's case/default statements
        try %[ execute-keys -draft k<a-x> <a-k> ^\h*(case|default).*:$ <ret> j<a-gt> ]
        # indent after keywords
        try %[ execute-keys -draft <semicolon><a-F>)MB <a-k> \A(if|else|while|for|try|catch)\h*\(.*\)\h*\n\h*\n?\z <ret> s \A|.\z <ret> 1<a-&>1<a-space><a-gt> ]
        # deindent closing brace(s) when after cursor
        try %[ execute-keys -draft <a-x> <a-k> ^\h*[})] <ret> gh / [})] <ret> m <a-S> 1<a-&> ]
    =
~

define-command -hidden elvish-indent-on-opening-curly-brace %[
    # align indent with opening paren when { is entered on a new line after the closing paren
    try %[ execute-keys -draft -itersel h<a-F>)M <a-k> \A\(.*\)\h*\n\h*\{\z <ret> s \A|.\z <ret> 1<a-&> ]
]

define-command -hidden elvish-indent-on-closing-curly-brace %[
    # align to opening curly brace when alone on a line
    try %[ execute-keys -itersel -draft <a-h><a-k>^\h+\}$<ret>hms\A|.\z<ret>1<a-&> ]
]

§
