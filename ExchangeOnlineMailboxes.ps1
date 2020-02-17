Connect-ExchangeOnlineShell

Get-Mailbox | Get-MailboxStatistics | Select DisplayName, LastLoggedOnUserAccount, ItemCount, TotalItemSize, LastLogonTime, LastLogoffTime | Sort-Object TotalItemSize  -Descending | Export-CSV \\mpbnas01\Info_Tech\mailboxes.csv