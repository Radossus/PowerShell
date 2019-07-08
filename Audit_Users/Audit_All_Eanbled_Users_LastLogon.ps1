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

Get-ADUser -SearchBase "DC=GI,DC=TEL,DC=COM" -Filter {enabled -eq $true}  -Properties $properties | Select-Object -Property SamAccountName, cn, Enabled,DisplayName,employeeType,GivenName,Surname,mail,mobile,tnDomainName,tnEmploymentStartDate,tnDomainLogin,tnEmploymentEndDate,tnJobLegalEntity,tnManager,@{ n = "LastLogonTimeStamp"; e = { [date]::FromFileTime( $_.lastLogonTimestamp ) } } | Export-Csv Users_Export.csv