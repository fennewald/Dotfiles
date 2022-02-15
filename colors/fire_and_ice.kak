# hc.kak
# A kakoune theme meant to emulate the high contrast theme inside Visual studio
# code

declare-option str bg 'rgb:000000'
declare-option str bright_bg 'rgb:08264b'
declare-option str bright_alt_bg 'rgb:665947'
declare-option str fg 'rgb:c7eff7'
declare-option str alt_fg 'rgb:f7d9c7'
declare-option str dim_fg 'rgb:203a59'
declare-option str red 'rgb:f33910'
declare-option str bright_blue 'rgb:a9a6fb'
declare-option str dim_blue 'rgb:203a59'
declare-option str blue 'rgb:6385ad'
declare-option str orange 'rgb:ff8720'
declare-option str pale_orange 'rgb:f8b964'
declare-option str bright_orange 'rgb:ff7600'
declare-option str dark_orange 'rgb:7d4230'

declare-option str grey 'rgb:888888'
declare-option str dim_grey 'rgb:dddddd'
declare-option str dark_grey 'rgb:555555'
declare-option str dim_red 'rgb:dd8888'
declare-option str green 'rgb:00bb00'
declare-option str dim_bright_orange 'rgb:fff6de'
declare-option str mustard 'rgb:ffc400'

# Idle line highlighting
#set-face global idlehl "default,%opt{dim_bright_orange}"
#set-face global ruler "default,%opt{dim_bright_orange}"
#hook global wincreate .* %{
#	add-highlighter window/ruler column 81 ruler
#}
#hook -group idlehl global focusout .* %{
#	remove-highlighter window/ruler
#	add-highlighter window/idleline line %val{cursor_line} idlehl
#	hook -once window focusin .* %{
#		remove-highlighter window/idleline
#		add-highlighter window/ruler column 81 ruler
#	}
#}

# For code
set-face global value "%opt{bright_orange}"
set-face global type "%opt{bright_blue}"
set-face global variable "%opt{orange}"
set-face global module "%opt{red}"
set-face global function "%opt{fg}"
set-face global string "%opt{red}"
set-face global keyword "%opt{pale_orange}"
set-face global operator "%opt{fg}"
set-face global attribute "%opt{fg}"
set-face global comment "%opt{dim_blue}"
set-face global meta "%opt{blue}"
set-face global builtin "%opt{fg}"

# Builtin Faces
set-face global Default "%opt{fg},%opt{bg}"
set-face global PrimarySelection "default,%opt{bright_bg}+b"
set-face global SecondarySelection "default,%opt{bright_alt_bg}"
set-face global PrimaryCursor "%opt{bg},%opt{fg}"
set-face global SecondaryCursor "%opt{fg},%opt{alt_fg}"
set-face global PrimaryCursorEol "default,%opt{red}"
set-face global SecondaryCursorEol "default,%opt{dim_red}"
set-face global LineNumbers "%opt{dim_fg},%opt{bg}"
set-face global LineNumberCursor "%opt{fg},%opt{bg}"
set-face global LineNumbersWrapped "%opt{grey},%opt{bg}"
set-face global MenuForeground "%opt{bg},%opt{fg}"
set-face global MenuBackground "%opt{fg},%opt{bg}"
set-face global MenuInfo "%opt{orange},%opt{bg}"
set-face global Information "%opt{orange},%opt{bg}"
set-face global Error "%opt{red},default+b"
set-face global StatusLine "%opt{fg},%opt{bg}"
set-face global StatusLineMode "%opt{fg},%opt{mustard}+b"
set-face global StatusLineInfo "%opt{fg}"
set-face global StatusLineValue "%opt{mustard}"
set-face global StatusCursor "%opt{bg},%opt{fg}"
set-face global Prompt "%opt{bg},%opt{fg}+b"
set-face global MatchingChar "default,default+b"
set-face global Whitespace "%opt{grey},%opt{bg}+f"
set-face global WrapMarker Whitespace
set-face global BufferPadding "%opt{dim_blue},%opt{bg}"

