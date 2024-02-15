#The paths
$List = Get-Content "C:\Users\User\Desktop\Recipients.txt"
$AttachmentPath = "D:\path\attachments.pdf"

#The loop and the configuration
Foreach ($list in $List){
    Write-Host $list
    $From = "user.userl@outlook.com"
    $TO = $List
    $Subject = "Subject"
    $Body = " Body of the email "
    $SMTPServer = "smtp.outlook.com"
    $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential("user.user@outlook.com", "Password")

    $MailMessage = New-Object System.Net.Mail.MailMessage($From, $To, $Subject, $Body)
    $Attachment = New-Object System.Net.Mail.Attachment($AttachmentPath)
    $MailMessage.Attachments.Add($Attachment)

    $SMTPClient.Send($MailMessage)
}
