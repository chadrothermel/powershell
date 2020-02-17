$aw = Get-Content \\mpbnas01\info_tech\aw.txt

$users = ($aw | %{Get-ADUser -filter "emailaddress -eq '$_'" -Properties EmailAddress}).samaccountname

Add-ADGroupMember -Identity mdm_migration -Members $users

(Get-ADGroupMember -Identity mdm_migration).samaccountname



