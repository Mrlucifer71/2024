Test-Connection localhost
get-command -Name '*netip*'
Get-NetIPAddress
Get-NetAdapter
Get-NetIPv4Protocol

$ip=Get-NetIPAddress

$ip


Get-NetIPAddress -AssociatedIPInterface 