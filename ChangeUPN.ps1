Import-Module ActiveDirectory
Get-ADUser -Filter "UserPrincipalName -like '*mpb-internal.com*'" -SearchBase "OU=User Accounts,DC=mpb-internal,DC=com" | 

ForEach { Set-ADUser -Identity $_.SamAccountName -UserPrincipalName "$($_.SamAccountName)@midpennbank.com" }
