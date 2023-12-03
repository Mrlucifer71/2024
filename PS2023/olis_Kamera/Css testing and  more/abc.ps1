Get-Process | Select-Object id, Name, ProcessName

Get-NetIPAddress
Get-NetIPConfiguration | Select Get-NetIPAddress    

$getipx= Get-NetIPConfiguration
$getipx
$getipx.Get-NetIPAddress
get-NetIPConfiguration | Get-Member

Get-NetIPConfiguration | Select-Object Ipv4 

Get-ChildItem | Get-Member

***********
$service=Get-Service

$date=Get-Date
$date.Year
$date.DayOfWeek
$date.Ticks

Get-Date | Get-Member
