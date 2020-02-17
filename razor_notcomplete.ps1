#Connect-ExchangeOnlineShell
$batch = import-csv '\\mpbnas01\Info_Tech\Excel Files\Razor_EmailDeletionlist.csv'
$mailboxes = $batch | foreach{get-mailbox $_.emailaddress}
$output = Foreach($mailbox in $mailboxes){

    $mailStats = Get-MailboxStatistics -Identity $mailbox.Displayname


    $prop = [ordered]@{
    
            Name = $mailbox.displayname
            Email = $mailbox.PrimarySmtpAddress
            ItemCount = $mailStats.ItemCount
            Size = $mailStats.TotalItemSize
    
    
    }
    New-object -TypeName psobject -Property $prop
}

$output | Export-Csv -NoTypeInformation '\\mpbnas01\Info_Tech\Excel Files\Razor_notcompleted.csv'