

# Skapa en rapport av vad som är installerat både hårdvara och mjukvara
<# Hårdvaar 
  CPU , Ram , Disk , snr , produkt nummer , Ilo Info
  Hostname, Antal Nic , IP, MAC adress, Nic Teaming Information, NiC inställingar , Duplex mm. 

  Mjukvara 
  OS , OS verstion , INstalld Futurers , Installed 
  Windows Firewall Status , 
   Winodws update status
  Antivirus , 
  Bacup solftware

  Services runing,
  IS the system ?

#>

# Bios infromation 
Get-CimInstance -ClassName Win32_BIOS
Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -Property SystemType
Get-CimInstance -ClassName Win32_ComputerSystem
Get-CimInstance -ClassName Win32_QuickFixEngineering

# Os infrormation
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property BuildNumber,BuildType,OSType,ServicePackMajorVersion,ServicePackMinorVersion
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property Build*,OSType,ServicePack*

# User Owner
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property NumberOfLicensedUsers, NumberOfUsers, RegisteredUser 


# Disk Space
Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"

Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" | Measure-Object -Property FreeSpace,Size -Sum | Select-Object -Property Property,Sum

# user login session

Get-CimInstance -ClassName Win32_LogonSession
Get-CimInstance -ClassName Win32_ComputerSystem -Property UserName

# time and Time server 
Get-CimInstance -ClassName Win32_LocalTime
# serveices 
# Get-CimInstance -ClassName Win32_Service | Select-Object -Property Status,Name,DisplayName

# Get-Service 


   


  
