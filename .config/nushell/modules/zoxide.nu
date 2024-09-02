const zoxide_file = "~/.zoxide.nu"

if not ($zoxide_file | path exists) {
    zoxide init nushell --hook prompt | save $zoxide_file
}

source $zoxide_file
