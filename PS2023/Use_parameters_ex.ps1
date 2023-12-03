Param ($computer)
Write-Output "Hello $computer"


Param ($computer)
Write-Output "Hello $computer"

Write-Output "Remote session to $computer"

psremote $computer # add -name to type in computername 

