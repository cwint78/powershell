#connect-exchangeonline

$MailboxAlias = "mailbox-name"  # Replace with the mailbox email

# Get mailbox permissions
$Permissions = Get-MailboxPermission -Identity $MailboxAlias | Where-Object {
    $_.User -notlike "NT AUTHORITY*" -and $_.User -notlike "S-1-5-*"  # Exclude system and default entries
}

# Export the permissions to a CSV file
$ExportPath = "path"
$Permissions | Select-Object User, AccessRights | Export-Csv -Path $ExportPath -NoTypeInformation