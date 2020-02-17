Connect-ExchangeOnlineShell


Add-RecipientPermission -Identity andrew.george@midpennbank.com -Trustee svc_smtp@midpennbank.com -AccessRights SendAs
 
add-MailboxFolderPermission -Identity couriers@midpennbank.com:\calendar -User “grcourierscalendarditors” -AccessRights editor

Get-mailbox -identity depops@midpennbank.com:\calendar | Set-MailboxFolderPermission -identity "depositops@midpennbank.com" -AccessRights Reviewer
Set-DistributionGroup -Identity "Dept - Deposit Operations Support" -Alias depositops
New-DistributionGroup -Type Security -Name “Couriers Calendar - Editors” -Alias “grcourierscalendarditors”



$IdentityMatch = "Klinepeter"
$DeviceID = (Get-MobileDevice | Where {$_.Identity -m "*Jane Gardner*"}).DeviceID
 
Get-CASMailbox -Identity "Jane Gardner" | Set-CASMailbox -ActiveSyncAllowedDeviceIDs $DeviceID


$deviceid = Get-mobiledevice | ? {$_.DeviceAccessState -ne "allowed" }

Foreach($device in $DeviceID){
Get-CASMailbox -Filter {activesyncenabled -eq $true} | Set-CASMailbox -ActiveSyncAllowedDeviceIDs $Device.deviceid
