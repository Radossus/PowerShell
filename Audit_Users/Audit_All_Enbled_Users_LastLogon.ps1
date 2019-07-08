$properties=@(
    'SamAccountName', 
    'cn',
    'Enabled',
    'DisplayName',
    'employeeType',
    'GivenName ',
    'Surname',
    'mail',
    'mobile',
    'tnDomainName',
    'tnDomainLogin',
    'tnEmploymentStartDate',
    'tnEmploymentEndDate',
    'tnJobLegalEntity',
    'tnManager',
    'LastLogonTimeStamp'
    )

Get-ADUser -SearchBase "OU=gcSSO,OU=OpCo,OU=People,OU=Global,DC=IAM,DC=GI,DC=TELENOR,DC=COM" -Filter {enabled -eq $true}  -Properties $properties | Select-Object -Property SamAccountName, cn, Enabled,DisplayName,employeeType,GivenName,Surname,mail,mobile,tnDomainName,tnEmploymentStartDate,tnDomainLogin,tnEmploymentEndDate,tnJobLegalEntity,tnManager,@{ n = "LastLogonTimeStamp"; e = { [datetime]::FromFileTime( $_.lastLogonTimestamp ) } } | Export-Csv Users_Export.csv 