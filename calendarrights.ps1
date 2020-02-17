Function Set-CalendarPermissions{
    [cmdletbinding()]
        Param(
        
            [string]$DLName
        
        
        
        
        
        )

New-DistributionGroup -Name "Loan Ops Calendar - Edit" -Alias loanopscaledit -Type security

add-MailboxFolderPermission loanopscalendar@midpennbank.com -User loanopscaledit -AccessRights editor


$Loanops = import-csv \\mpbnas01\Info_Tech\loanopscal.csv

$Loanops | %{Add-DistributionGroupMember -Identity loanopscaledit -Member $_.member}

}