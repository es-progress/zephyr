bkup() {
    local file="${1?:"File missing"}"
    cp -a "${file}" "${file}.bak"
}
