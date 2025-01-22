#Connect-ExchangeOnline


# Define the distribution list // Can be full distribution list address as well
$distributionList = "name"

# Get the members of the distribution list
$members = Get-DistributionGroupMember -Identity $distributionList

# Export the members to a CSV file
$members | Select-Object Name, PrimarySmtpAddress | Export-Csv -Path "path" -NoTypeInformation

Write-Output "Export completed. The list of members has been saved to downloads"