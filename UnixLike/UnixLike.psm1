function Get-Command-Source($name) {
    Get-Command $name | Select-Object -ExpandProperty Source
}

Export-ModuleMember -Function Get-Command-Source -Alias which
