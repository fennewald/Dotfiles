# hc.kak
# A kakoune theme meant to emulate the high contrast theme inside Visual studio
# code

declare-option str bg 'rgb:ffffff'
declare-option str fg 'rgb:111111'
declare-option str grey 'rgb:888888'
declare-option str dim_grey 'rgb:dddddd'
declare-option str dark_grey 'rgb:555555'
declare-option str red 'rgb:bb0000'
declare-option str dim_red 'rgb:dd8888'
declare-option str green 'rgb:00bb00'
declare-option str yellow 'rgb:bf9300'
declare-option str dim_yellow 'rgb:fff6de'
declare-option str blue 'rgb:0000ff'
declare-option str dim_blue 'rgb:4444bb'
declare-option str mustard 'rgb:ffc400'

# Idle line highlighting
set-face global idlehl "default,%opt{dim_yellow}"
set-face global ruler "default,%opt{dim_yellow}"
hook global WinCreate .* %{
	add-highlighter window/ruler column 81 ruler
}
hook -group idlehl global FocusOut .* %{
	remove-highlighter window/ruler
	add-highlighter window/idleline line %val{cursor_line} idlehl
	hook -once window FocusIn .* %{
		remove-highlighter window/idleline
		add-highlighter window/ruler column 81 ruler
	}
}

# For code
set-face global value "%opt{yellow}"
set-face global type "%opt{blue}"
set-face global variable "%opt{fg}"
set-face global module "%opt{red}"
set-face global function "%opt{red}"
set-face global string "%opt{yellow}"
set-face global keyword "%opt{red}"
set-face global operator "%opt{blue}"
set-face global attribute "%opt{dark_grey}"
set-face global comment "%opt{dim_blue}"
set-face global meta "%opt{blue}"
set-face global builtin "%opt{blue}"

# Builtin Faces
set-face global Default "%opt{fg},%opt{bg}"
set-face global PrimarySelection "default,%opt{dim_grey}+b"
set-face global SecondarySelection "default,%opt{dim_grey}"
set-face global PrimaryCursor "%opt{fg},%opt{grey}"
set-face global SecondaryCursor "%opt{fg},%opt{grey}"
set-face global PrimaryCursorEol "default,%opt{dim_red}"
set-face global SecondaryCursorEol "default,%opt{dim_red}"
set-face global LineNumbers "%opt{fg},%opt{bg}"
set-face global LineNumberCursor "%opt{bg},%opt{fg}"
set-face global LineNumbersWrapped "%opt{grey},%opt{bg}"
set-face global MenuForeground "%opt{bg},%opt{fg}"
set-face global MenuBackground "%opt{fg},%opt{dim_grey}"
set-face global MenuInfo "%opt{fg},%opt{mustard}"
set-face global Information "%opt{fg},%opt{mustard}"
set-face global Error "%opt{red},default+b"
set-face global StatusLine "%opt{fg},%opt{dim_grey}"
set-face global StatusLineMode "%opt{fg},%opt{mustard}+b"
set-face global StatusLineInfo "%opt{fg}"
set-face global StatusLineValue "%opt{mustard}"
set-face global StatusCursor "%opt{bg},%opt{fg}"
set-face global Prompt "%opt{fg},%opt{mustard}+b"
set-face global MatchingChar "default,default+b"
set-face global Whitespace "%opt{grey},%opt{bg}+f"
set-face global WrapMarker Whitespace
set-face global BufferPadding "%opt{dim_blue},%opt{bg}"

