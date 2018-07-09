function Get-Command-Source($name) {
    Get-Command $name | Select-Object -ExpandProperty Source
}

New-Alias -Name which -Value Get-Command-Source
