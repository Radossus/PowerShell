Import-Module ActiveDirectory
$properties=@(
    'displayname', 
    'employeeNumber',
    'mail',
    'enabled'
    )

$expressions=@(
    @{Expression={$_.DisplayName};Label="Jmeno"},
    @{Expression={$_.employeeNumber};Label="Osobni cislo"}
    @{Expression={$_.mail};Label="Email"}
    @{Expression={$_.enabled};Label="Povolen"}
    )

$path_to_file = "C:\Support\2.2.All-Enabled-Users_$((Get-Date).ToString('yyyy-MM-dd_hh-mm-ss')).txt"

Get-ADUser -Filter{enabled -eq $true} -Properties $properties | select $expressions | Out-File $path_to_file