#copy data between containers

$StorageConfig = Get-CFStorageAccountConfiguration | Where-Object {$_.ProductID -eq "360 Online" -and $_.Subscription -eq "360 Online Norway East" -and $_.Purpose -eq "Archive"};

Write-Output "StorageConfig : $StorageConfig"
$StorageAccountName = $StorageConfig.Name;
$StorageSubscription = $StorageConfig.Subscription;

# For uploading results to Azure storage 
    
$StorageKey = Get-CFStorageAccountKey -StorageAccountName $StorageAccountName;
$context = New-CFStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageKey -SubscriptionName $StorageSubscription;

$sourcecontainername = "ba618784-6a73-4f0d-9f35-d8c8a259f523archives"

$sourcecontainer = Get-AzStorageContainer -Name $sourcecontainername -Context $context


$destcontainername = "kristiansund-radek"


$filelist = Get-AzStorageBlob -Container $sourcecontainername -Context $context

<#
$exludedFiles = @();
$exludedFiles += "2019_10/230140_1_1.PDF";
$exludedFiles += "2019_10/230141_1_1.PDF";
#>

#$exludedFiles.GetType();

$exludedFiles = @(Get-Content C:\Users\farm1990Admin\Documents\Radek\kristiansund.txt);

#$exludedFiles2.GetType();


foreach ($file in $filelist)
{
   
    if ($file.name -in $exludedFiles)
    {
       Write-Host "Skipping exluded file " + $file.Name;
       continue;
    }    
        Write-Host "Copy file " + $file.Name;
        try{
            Start-AzStorageBlobCopy -SrcContainer $sourcecontainername -SrcBlob $file.name -DestContainer $destcontainername -DestBlob $file.name -Context $context
        }catch
        {
            Write-Host "File does not exists " + $file.Name;
        }
}
