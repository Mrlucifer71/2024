# Get OS information
$os = Get-CimInstance -ClassName Win32_OperatingSystem
Write-Host "OS Name: $($os.Caption)"
Write-Host "OS Version: $($os.Version)"

# Get BIOS information
$bios = Get-CimInstance -ClassName Win32_BIOS
Write-Host "BIOS Version: $($bios.Version)"
Write-Host "Serial Number: $($bios.SerialNumber)"

# Get disk information
$disk = Get-CimInstance -ClassName Win32_DiskDrive | Select-Object -First 1
$diskSizeGB = [math]::Round(($disk.Size / 1GB), 2)
Write-Host "Disk Size: $($diskSizeGB)GB"

# Get network information
$network = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true }
Write-Host "MAC Address: $($network.MACAddress)"
Write-Host "IP Address: $($network.IPAddress[0])"

$dnsHostName = $env:COMPUTERNAME
$fqdn = [System.Net.Dns]::GetHostByName($dnsHostName).HostName
Write-Host "DNS Hostname: $dnsHostName"
Write-Host "FQDN: $fqdn"
<#
# Get installation date
$installDate = $os.InstallDate
# Convert the WMI date format to a readable date
$installDate = [Management.ManagementDateTimeConverter]::ToDateTime($installDate)
Write-Host "Operating System Installation Date: $installDate"
#>

 # Generate the output file

 $report | Out-File -FilePath "C:\Users\fralib\Documents\PS-Projects\reportX.txt"
 Write-Host "System information has been saved to: C:\Users\fralib\Documents\PS-Projects\reportX.txt"


<#
 # Convert the object to HTML, save it to a file, and display the file path to the user
 $report | ConvertTo-Html -Title "System Information" -As Table -Fragment | Out-File -FilePath "C:\Users\fralib\Downloads\Powershell\reports\Report.html"
 Write-Host "System information has been saved to: C:\Users\fralib\Downloads\Powershell\reports\Report.html"

 # Open the report with Internet Explorer
 Invoke-Expression "C:\Program Files\Internet Explorer\iexplore.exe C:\Users\fralib\Downloads\Powershell\reports\Report.html"
#>
