#Connect-ExchangeOnlineShell

$mailboxes = import-csv '\\mpbnas01\Info_Tech\mailbox_permissions.csv'

Foreach($mailbox in $mailboxes){

    Remove-MailboxPermission -Identity $mailbox.Mailbox -User $mailbox.User  -AccessRights $mailbox.AccessRights -InheritanceType All

}