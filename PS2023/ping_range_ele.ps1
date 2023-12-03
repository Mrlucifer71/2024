# Function to ping an IP address
function Ping-IP {
    param([string]$ip)

    $ping = New-Object System.Net.NetworkInformation.Ping
    $result = $ping.Send($ip)

    if ($result.Status -eq 'Success') {
        return $true
    }
    else {
        return $false
    }
}

# Prompt the user to enter an IP range
$ip_range = Read-Host "Enter an IP range (e.g. 192.168.0.1-10)"

# Split the range into its start and end IP addresses
$start_ip, $end_ip = $ip_range.Split("-")

# Convert the start and end IPs to integers
$start_ip = [int]($start_ip -replace "[^0-9]")
$end_ip = [int]($end_ip -replace "[^0-9]")

$results = @()
for ($i = $start_ip; $i -le $end_ip; $i++) 
{
    $ip = "$($i >> 24).$($i >> (16 % 256)).$($i >> (8 % 256)).$($i % 256)"
    if (Test-Connection $ip -Quiet) {
        $results += $ip
    }
}


# Print the list of IPs that responded to the ping
Write-Host "IPs that responded to ping:"
foreach ($ip in $results) {
    Write-Host $ip
}
