function Get-CommandSource($name) {
    Get-Command $name | Select-Object -ExpandProperty Source
}

New-Alias -Name which -Value Get-CommandSource
