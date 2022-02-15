set-option global lsp_hover_anchor true
set-option global lsp_diagnostic_line_error_sign '!'
set-option global lsp_diagnostic_line_warning_sign '!'
set-option global lsp_diagnostic_line_info_sign '!'
set-option global lsp_diagnostic_line_hint_sign '!'
set-option global lsp_hover_max_lines 16
set-option global lsp_config %{
    [language.python.settings._]
    "pyls.configurationSources" = ["flake8"]
}
