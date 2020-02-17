Connect-ExchangeOnlineShell

$mailboxes = import-csv '\\mpbnas01\Info_Tech\Powershell\Mail Migration\Mailbox_Rights\FullAccess_MailboxRights.csv'

Foreach($mailbox in $mailboxes){

    Add-MailboxPermission -Identity $mailbox.Mailbox -User $mailbox.User  -AccessRights $mailbox.AccessRights -InheritanceType All

}

#Add-MailboxPermission -Identity newsflash@midpennbank.com -User dawn.spahr@midpennbank.com -AccessRights FullAccess, ReadPermission -InheritanceType All


New-DistributionGroup -Name "Loan Ops Calendar - Edit" -Alias loanopscaledit -Type security
add-MailboxFolderPermission loanopscalendar@midpennbank.com -User loanopscaledit -AccessRights editor


$Loanops = import-csv \\mpbnas01\Info_Tech\loanopscal.csv

$Loanops | %{Add-DistributionGroupMember -Identity loanopscaledit -Member $_.member}