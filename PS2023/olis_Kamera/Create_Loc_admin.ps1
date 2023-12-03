
# Define the server name where you want to create the local user
$ServerName = "wsus.lb.se"
$Username = "Change_to_admin"  # Set the username
$PlainTextPassword = Read-Host "Enter the password for the new local user" -AsSecureString

# Convert the plain text password to a secure string
$SecurePassword = ConvertTo-SecureString -String $PlainTextPassword -AsPlainText -Force

# Prompt for the admin credentials with appropriate permissions on the remote server
$AdminCredentials = "lb.se\fladmin"

# Use Invoke-Command to run the user creation and group membership commands remotely
Invoke-Command -ComputerName $ServerName -Credential $AdminCredentials -ScriptBlock {
    param (
        [string]$Username,
        [securestring]$Password
    )

    # Create the local user
    New-LocalUser -Name $Username -Password $Password -FullName $Username

    # Set the password to never expire
    Set-LocalUser -Name $Username -PasswordNeverExpires $true

    # Add the user to the local administrators group

        Add-LocalGroupMember -Group "Administrators" -Member $Username
} -ArgumentList $Username, $SecurePassword



