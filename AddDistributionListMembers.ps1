connect-exchangeonline

# Define the path to the CSV file
$csvFilePath = "path"

# Define the distribution group // Can use name or exact email
$distributionList = "name"

# Import the CSV file
$users = Import-Csv -Path $csvFilePath

# Loop through each user and add them to the distribution list
foreach ($user in $users) {
    try {
        Add-DistributionGroupMember -Identity $distributionList -Member $user.Email
        Write-Host "Added $($user.Name) <$($user.Email)> to $distributionList" -ForegroundColor Green
    } catch {
        Write-Host "Failed to add $($user.Name) <$($user.Email)>: $($_.Exception.Message)" -ForegroundColor Red
    }
}