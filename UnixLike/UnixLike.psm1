function Get-CommandSource([Parameter(Mandatory=$True)][String]$Name) {
    Get-Command $Name | Select-Object -ExpandProperty Source
}

function Select-PipedString(
    [Parameter(Mandatory)][String]$Regex
    , [String]$DirOrFile
    , [bool]$Recurse = false
    , [Parameter(ValueFromPipeline=$True)]$Input) {
    $items = if(Test-Path -Path $DirOrFile -PathType Container) {
        Get-ChildItem -Recurse $Recurse $DirOrFile | ForEach-Object { $_.ToString() }
    } elseif($DirOrFile) {
        Get-ChildItem $DirOrFile
    } else {
        $Input | ForEach-Object { $_.ToString() }
    }

    return $items | Select-String $Regex
}

New-Alias -Name which -Value Get-CommandSource
New-Alias -Name df -Value Get-Volume
New-Alias -Name grep -Value Select-PipedString

