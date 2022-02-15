# Create and implement the rfc command

define-command -params 1 -docstring %{ Open the rfc of the given id } rfc %{
    try %{
        evaluate-commands %sh{ printf "buffer *rfc%d*" $1 }
    } catch %{
        evaluate-commands %sh{
            printf "evaluate-commands %%{
                edit -scratch *rfc%d*
                exec '!rfc %d<ret>'
            }\n" $1 $1
        }
    }
}
