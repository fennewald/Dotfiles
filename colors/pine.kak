# pine.kak
# A kakoune theme for the cleaner side of life

# Color palette
declare-option str bg 'rgb:efefeb'
declare-option str fg 'rgb:000400'


declare-option str black 'rgb:030d0d'
declare-option str gray 'rgb:8e9088'
declare-option str white 'rgb:e0e1dc'
declare-option str blue 'rgb:285c44'
declare-option str cyan 'rgb:2f4237'
declare-option str green 'rgb:404940'
declare-option str orange 'rgb:8a592b'
declare-option str pink 'rgb:8e6060'
declare-option str purple 'rgb:082321'
declare-option str red 'rgb:4a3232'
declare-option str yellow 'rgb:636d4e'

declare-option str background %opt{black}
declare-option str dimmed_background %opt{gray}
declare-option str foreground %opt{white}

# Reference
# https://github.com/mawww/kakoune/blob/master/colors/default.kak
# For code
set-face global value "%opt{green}"
set-face global type "%opt{purple}"
set-face global variable "%opt{red}"
set-face global module "%opt{red}"
set-face global function "%opt{red}"
set-face global string "%opt{yellow}"
set-face global keyword "%opt{cyan}"
set-face global operator "%opt{orange}"
set-face global attribute "%opt{pink}"
set-face global comment "%opt{blue}+i"
set-face global meta "%opt{red}"
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
set-face global Default "%opt{fg},%opt{bg}"
set-face global PrimarySelection "rgb:353a3a,rgb:8ab78a"
set-face global SecondarySelection "rgb:353a3a,rgb:8d8ab7"
set-face global PrimaryCursor "rgb:efefeb,rgb:253232"
set-face global SecondaryCursor "rgb:efefeb,rgb:253232"
set-face global PrimaryCursorEol "rgb:efefeb,rgb:253232"
set-face global SecondaryCursorEol "rgb:efefeb,rgb:253232"
set-face global LineNumbers "%opt{gray},%opt{bg}"
set-face global LineNumberCursor "rgb:253232,%opt{bg}"
set-face global LineNumbersWrapped "%opt{gray},%opt{black}+i"
set-face global MenuForeground "%opt{bg},rgb:6a7a6a"
set-face global MenuBackground "%opt{white},rgb:6a7a6a"
set-face global MenuInfo "%opt{cyan},rgb:6a7a6a"
set-face global Information "%opt{yellow},%opt{gray}"
set-face global Error "%opt{black},%opt{red}"
set-face global StatusLine "%opt{fg},%opt{bg}"
set-face global StatusLineMode "%opt{black},%opt{bg}"
set-face global StatusLineInfo "%opt{purple},%opt{bg}"
set-face global StatusLineValue "%opt{orange},%opt{bg}"
set-face global StatusCursor "%opt{white},%opt{bg}"
set-face global Prompt "%opt{green},%opt{bg}"
set-face global MatchingChar "%opt{black},%opt{blue}"
set-face global Whitespace "%opt{gray},%opt{black}+f"
set-face global WrapMarker Whitespace
set-face global BufferPadding "%opt{gray},%opt{bg}"
