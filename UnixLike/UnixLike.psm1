function Get-CommandSource([Parameter(Mandatory=$True)][String]$Name) {
    Get-Command $Name | Select-Object -ExpandProperty Source
}

New-Alias -Name which -Value Get-CommandSource
