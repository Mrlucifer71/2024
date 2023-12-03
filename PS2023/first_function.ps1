# Parameters
param([string]$dir="C:\Users\fralib\Downloads")

#Functions
function get-dirinfo($dir)
{
    $result = Get-ChildItem $dir -Recurse |Measure-Object -Property Length -Sum
    return [math]::round(($result).sum/1GB,2) 

}

# Maine processing
$result = get-dirinfo $dir

Write-Host $result "GB"


get-dirinfo C:\Users\fralib\Downloads


C:\Users\fralib\Documents

(get-dirinfo C:\Users\fralib\Documents).sum

# covert to bytes 

(get-dirinfo C:\Users\fralib\Documents).sum/1MB

# .net mathlib till att runda av siffran

 [math]::round((get-dirinfo C:\Users\fralib\Documents).sum/1MB,4) 

