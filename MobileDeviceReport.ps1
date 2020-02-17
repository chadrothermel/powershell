Connect-ExchangeOnlineShell

$Header = @"
<style>
body { background-color:#f6f6f6; font-family:calibri; margin:0px;}
TABLE {border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}
TH {border-width: 1px;padding: 3px;border-style: solid;border-color: black;background-color: #34495e; color:#ffffff}
TD {border-width: 1px;padding: 3px;border-style: solid;border-color: black;}
TR:Nth-Child(Even) {Background-Color: #dddddd;}
 </style>
"@
$count = (Get-MobileDevice -Filter "userdisplayname -notlike '*NAMPR13A005*' -and userdisplayname -ne 'Chad  Rothermel' -and userdisplayname -ne 'Anthony Falco' " | select userdisplayname | get-unique -AsString).count
$mobiledevices = Get-MobileDevice -Filter "userdisplayname -notlike '*NAMPR13A005*' -and userdisplayname -ne 'Chad  Rothermel' -and userdisplayname -ne 'Anthony Falco'" | select userdisplayname   
$unique = $mobiledevices | get-unique -AsString
$mobiledevices = $unique | ConvertTo-Html -Head $Header | Out-String


$link = '<a href="https://www.midpennbank.com">midpennbank.com</a>'
$facebook = '<a href="https://www.facebook.com/midpennbank">Facebook</a>'
$twitter = '<a href="https://www.twitter.com/mid_penn_bank">Twitter</a>'

$mailprops = @{
    Body="<body style='font-family: Calibri'><p>
           All,</br>
           </br>
           The users that have connected to Intune using the Outlook App so far.</br>
           $mobiledevices
           </p>
           </br>
           Thanks,
           <p>
           Chad Rothemel</br>
           Systems Architect</br>
           <b>Mid Penn Bank</b></br>
           Tel: (717) 896-5390  Cell: (717) 991-0868</br>
           $link</br>
           <b>Follow us:</b> $facebook | $twitter
           </p>
           </body>"
    
    From='chad.rothermel@midpennbank.com'
    To= 'Dept.IT@midpennbank.com'
    Cc='johnpaul.livingston@midpennbank.com'
    SmtpServer='smtprelay'
    BodyAsHtml=$true
    Subject="Outlook App Users Update - Count = $count"


}

Send-MailMessage @mailprops