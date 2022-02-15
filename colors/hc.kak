# hc.kak
# A kakoune theme meant to emulate the high contrast theme inside Visual studio
# code

declare-option str bg 'rgb:000000'
declare-option str fg 'rgb:ffffff'
declare-option str fg_di 'rgb:bbbbbb'
declare-option str orange 'rgb:'

# TODO add modeline formatting

# Idle line highlighting
set-face global idlehl "rgb:000000,rgb:eb7734+F"
set-face global ruler "default,rgb:111111"
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

# Builtin Faces
set-face global Default "%opt{fg},%opt{bg}"

set-face global PrimarySelection "%opt{bg},%opt{fg}"
set-face global SecondarySelection "%opt{bg},%opt{fg_di}"
set-face global PrimaryCursor "%opt{bg},%opt{fg}"
#set-face global SecondaryCursor "rgb:efefeb,rgb:253232"
#set-face global PrimaryCursorEol "rgb:efefeb,rgb:253232"
#set-face global SecondaryCursorEol "rgb:efefeb,rgb:253232"
#set-face global LineNumbers "%opt{gray},%opt{bg}"
#set-face global LineNumberCursor "rgb:253232,%opt{bg}"
#set-face global LineNumbersWrapped "%opt{gray},%opt{black}+i"
#set-face global MenuForeground "%opt{bg},rgb:6a7a6a"
#set-face global MenuBackground "%opt{white},rgb:6a7a6a"
#set-face global MenuInfo "%opt{cyan},rgb:6a7a6a"
#set-face global Information "%opt{yellow},%opt{gray}"
#set-face global Error "%opt{black},%opt{red}"
#set-face global StatusLine "%opt{fg},%opt{bg}"
#set-face global StatusLineMode "%opt{black},%opt{bg}"
#set-face global StatusLineInfo "%opt{purple},%opt{bg}"
#set-face global StatusLineValue "%opt{orange},%opt{bg}"
#set-face global StatusCursor "%opt{white},%opt{bg}"
#set-face global Prompt "%opt{green},%opt{bg}"
#set-face global MatchingChar "%opt{black},%opt{blue}"
#set-face global Whitespace "%opt{gray},%opt{black}+f"
#set-face global WrapMarker Whitespace
#set-face global BufferPadding "%opt{gray},%opt{bg}"
