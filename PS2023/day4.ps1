# day4
# Varibel
$filepath = "C:\Users\fralib\Documents\PS-Projects\"
$outfile = "report.txt"
$date = Get-Date

# header
$report="Installation Report $date`n" 


# get Hardware 
# Get BIOS information
$bios = Get-CimInstance -ClassName Win32_BIOS
$report += "BIOS Version: $($bios.Version)`n"
$report += "Serial Number: $($bios.SerialNumber)`n"

# test 



# Get disk information
$disk = Get-CimInstance -ClassName Win32_DiskDrive | Select-Object -First 1
$diskSizeGB = [math]::Round(($disk.Size / 1GB), 2)
$report += "Disk Size: $($diskSizeGB)GB`n"
# need to list all disk in the system
# Get-PsDrive -PsProvider FileSystem
# net use
$alldisksize=Get-CimInstance Win32_LogicalDisk | Select-Object DeviceID,MediaType, @{Name='Size(GB)'; Expression={"{0:N2}" -f ($_.Size / 1GB)}}
$alldisksize 
# "Media type 12 = HD"
# behöver få resultatet i gb =Solved
# abc


# Get OS
$os = Get-CimInstance -ClassName Win32_OperatingSystem
$report += "OS Name: $($os.Caption)`n"
$report += "OS Version: $($os.Version)`n"

# get installation date 
$osInstallDate = $os.InstallDate
$report += "OS Install Date: $($osInstallDate)`n"

# Get Active directory
# need ad mode installed 

$ad = Get-ADComputer -Identity $env:COMPUTERNAME -Properties *
if ($ad) {
    $report += "AD Domain: $($ad.DNSHostName)`n"
    $report += "AD Site Name: $($ad.Site)`n"
    $report += "AD OU: $($ad.DistinguishedName)`n"
} else {
    $report += "System is not part of an Active Directory.`n"
}


# Get network information
$network = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true }
$report += "MAC Address: $($network.MACAddress)`n"
$report += "IP Address: $($network.IPAddress[0])`n"

# Get NIC Teaming information if available
$nicTeaming = Get-NetLbfoTeam | Select-Object -First 1
if ($nicTeaming) {
    $report += "NIC Teaming Name: $($nicTeaming.Name)`n"
    $report += "NIC Teaming Members: $($nicTeaming.Members)`n"
} else {
    $report += "NIC Teaming not configured on this system.`n"
}

$dnsHostName = $env:COMPUTERNAME
$fqdn = [System.Net.Dns]::GetHostByName($dnsHostName).HostName
$report += "DNS Hostname: $dnsHostName`n"
$report += "FQDN: $fqdn`n"


$option = Read-Host -Prompt 'Press 1 to see the report or 2 to save it in a file'
switch ($option) {
    1 {
        Write-Host $report -ForegroundColor Blue
    }
    2 {
        $report | Out-File -FilePath ($filepath + $outfile)
    }
    default {
        Write-Host "Invalid option."
    }
}




