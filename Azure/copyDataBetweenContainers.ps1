#copy data between containers

$StorageConfig = Get-CFStorageAccountConfiguration | Where-Object {$_.ProductID -eq "360 Online" -and $_.Subscription -eq "AzureStack NO" -and $_.Purpose -eq "Archive"};

Write-Output "StorageConfig : $StorageConfig"
$StorageAccountName = $StorageConfig.Name;
$StorageSubscription = $StorageConfig.Subscription;

# For uploading results to Azure storage 
    
$StorageKey = Get-CFStorageAccountKey -StorageAccountName $StorageAccountName;
$context = New-CFStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageKey -SubscriptionName $StorageSubscription;

$sourcecontainername = "00000000-abcd-0000-0000-123456789abcarchives"

$sourcecontainer = Get-AzStorageContainer -Name $sourcecontainername -Context $context


$destcontainername = "000contoso"

$sourcecontainername = "sourcecontainer"
$destcontainername = "destcontainer"

$filelist = Get-AzureStorageBlob -Container $sourcecontainername -Context $storageAccountContext

foreach ($file in $filelist)
{
    Start-AzureStorageBlobCopy -SrcContainer $sourcecontainername -SrcBlob $file.name -DestContainer $destcontainername -DestContext $destcontainername
}