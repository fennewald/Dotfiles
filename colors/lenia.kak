# A theme based around lenia

# Special colors
declare-option str brown 'rgb:231614'
declare-option str darkbrown 'rgb:110807'
declare-option str gray 'rgb:44475a'
declare-option str green 'rgb:7fff7f'
declare-option str dim_green 'rgba:7fff7f44'
declare-option str yellow 'rgb:ffff00'
declare-option str dim_yellow 'rgba:ffff0044'
declare-option str cyan 'rgb:00ffff'
declare-option str purple 'rgb:7f7fff'
declare-option str red 'rgba:ff0000bb'
declare-option str dim_red 'rgb:2f0000'
declare-option str orange 'rgb:ffb86c'
declare-option str dim_orange 'rgb:ff7f00'
declare-option str blue 'rgb:007fff'

declare-option str black 'rgb:000000'
declare-option str white 'rgb:f8f8f2'
declare-option str pink 'rgb:ff79c6'

declare-option str menu_orange 'rgb:ffb86c'
declare-option str dim_menu_orange 'rgb:68321a'

declare-option str background %opt{black}
declare-option str dimmed_background %opt{black}
declare-option str foreground %opt{white}

# Reference
# https://github.com/mawww/kakoune/blob/master/colors/default.kak
# For code
set-face global value "%opt{blue}"
set-face global type "%opt{cyan}"
set-face global variable "%opt{red}"
set-face global module "%opt{white}"
set-face global function "%opt{orange}"
set-face global string "%opt{white}"
set-face global keyword "%opt{white},+i"
set-face global operator "%opt{orange}"
set-face global attribute "%opt{pink}"
set-face global comment "%opt{dim_green}+i"
set-face global meta "%opt{white}"
set-face global builtin "%opt{white}+b"

# For markup
set-face global title "%opt{red}"
set-face global header "%opt{orange}"
set-face global bold "%opt{pink}"
set-face global italic "%opt{purple}"
set-face global mono "%opt{green}"
set-face global block "%opt{cyan}"
set-face global link "%opt{green}"
set-face global bullet "%opt{green}"
set-face global list "%opt{white}"

# Builtin faces
set-face global Default "%opt{white},%opt{background}"

# Cursor
set-face global PrimarySelection "%opt{green},%opt{dim_green}"
set-face global PrimaryCursor "%opt{black},%opt{green}"
set-face global PrimaryCursorEol "%opt{black},%opt{green}"
set-face global SecondarySelection "%opt{yellow},%opt{dim_yellow}"
set-face global SecondaryCursor "%opt{black},%opt{yellow}"
set-face global SecondaryCursorEol "%opt{black},%opt{yellow}"
# Line Numbers
set-face global LineNumberCursor "%opt{white},%opt{dimmed_background}"
set-face global LineNumbers "%opt{gray},%opt{dimmed_background}+i"
set-face global LineNumbersWrapped "%opt{gray},%opt{dimmed_background}+i"
# Menu
set-face global MenuForeground "%opt{menu_orange},%opt{dim_menu_orange}+b"
set-face global MenuBackground "%opt{white},%opt{dimmed_background}"
set-face global MenuInfo "%opt{cyan},%opt{blue}"

set-face global Information "%opt{dim_green},%opt{dimmed_background}"
set-face global Error "%opt{black},%opt{red}"

set-face global StatusLine "%opt{white},%opt{background}"
set-face global StatusLineMode "%opt{black},%opt{green}"
set-face global StatusLineInfo "%opt{purple},%opt{black}"
set-face global StatusLineValue "%opt{orange},%opt{black}"
set-face global StatusCursor "%opt{black},%opt{green}"
set-face global Prompt "%opt{black},%opt{green}"
set-face global MatchingChar "%opt{green}"
set-face global Whitespace "%opt{background}"
set-face global WrapMarker Whitespace
set-face global BufferPadding "%opt{gray},%opt{dimmed_background}"

# Lsp
set-face global LineFlagError "%opt{red},%opt{dim_red}+bi"
set-face global LineFlagWarning "%opt{yellow},%opt{dim_yellow}+bi"
