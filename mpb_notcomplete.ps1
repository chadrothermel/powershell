Connect-ExchangeOnlineShell

$batch = import-csv C:\Users\Public\Desktop\LeeAnn\Batch11.csv
$batch += import-csv C:\Users\Public\Desktop\LeeAnn\Batch12.csv
$batch += import-csv C:\Users\Public\Desktop\Evan\Batch6.csv
$batch += import-csv C:\Users\Public\Desktop\Evan\Batch7.csv
$batch += import-csv C:\Users\Public\Desktop\Evan\Batch8.csv
$batch += import-csv C:\Users\Public\Desktop\LeeAnn\Batch11.csv
$batch += import-csv C:\Users\Public\Desktop\LeeAnn\Batch12.csv
$batch += import-csv C:\Users\Public\Desktop\Nate\Batch13.csv
$batch += import-csv C:\Users\Public\Desktop\Nate\Batch14.csv
$batch += import-csv C:\Users\Public\Desktop\Nate\Batch15.csv
$batch += import-csv C:\Users\Public\Desktop\Chad\Batch16.csv
$batch += import-csv C:\Users\Public\Desktop\Zack\Batch17.csv
$batch += import-csv C:\Users\Public\Desktop\Zack\Batch18.csv
$batch += import-csv C:\Users\Public\Desktop\Brandt\Batch19.csv
$batch += import-csv C:\Users\Public\Desktop\Brandt\Batch20.csv

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

$output | ?{$_.itemcount -gt '700'} | Export-Csv -NoTypeInformation '\\mpbnas01\Info_Tech\Excel Files\mpb_notcompleted.csv'