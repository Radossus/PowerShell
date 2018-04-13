Import-Module ActiveDirectory
$properties=@(
    'employeeNumber',
    'givenName', 
    'sn',
    'sAMAccountName',
    'enabled',
    'description'
    )

$expressions=@(
    @{Expression={$_.employeeNumber};Label="Osobni cislo"},
    @{Expression={$_.givenName};Label="Jmeno"},
    @{Expression={$_.sn};Label="Prijmeni"}
    @{Expression={$_.sAMAccountName};Label="Login"}
    @{Expression={$_.enabled};Label="Enable Account?"}
    @{Expression={$_.description};Label="Jmeno stanice"}
    )

$path_to_file = "C:\Support\All-Users_$((Get-Date).ToString('yyyy-MM-dd_hh-mm-ss')).csv"

#Get-ADUser -Filter{enabled -eq $false -or enabled -eq $true} -Properties $properties | select $expressions | Out-File $path_to_file
Get-ADUser -Filter{enabled -eq $false -or enabled -eq $true} -Properties $properties | select $expressions | Export-Csv C:\Support\users.csv -Encoding UTF8