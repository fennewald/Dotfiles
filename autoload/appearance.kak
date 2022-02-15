# appearance.kak
# A file for editing appearance of kakoune
# -----------------------------------------
colorscheme flora
set-option global ui_options terminal_assistant=none

#set-face global crosshairs_line default,rgb:222222+bd
#set-face global crosshairs_column default,rgb:222222+bd

add-highlighter global/ number-lines -separator ' ' -cursor-separator '>' -hlcursor
add-highlighter global/ show-matching
#add-highlighter global/ show-whitespaces

define-command show-ruler -docstring 'Show document ruler' %{ add-highlighter buffer/ column 81 PrimarySelection }
define-command hide-ruler -docstring 'Hide document ruler' %{ remove-highlighter buffer/column_81_PrimarySelection }
