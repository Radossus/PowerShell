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
    
    Get-ADUser -SearchBase "DC=GI,DC=TELE,DC=COM" -Filter {(enabled -eq $true) -and (cn -like 'P*')}  -Properties $properties | Select-Object -Property SamAccountName, cn, Enabled,DisplayName,employeeType,GivenName,Surname,mail,mobile,tnDomainName,@{N='tnEmploymentStartDate';E={$_.tnEmploymentStartDate[0]}},tnDomainLogin,@{N='tnEmploymentEndDate';E={$_.tnEmploymentEndDate[0]}},@{N='tnJobLegalEntity';E={$_.tnJobLegalEntity[0]}},@{N='tnManager';E={$_.tnManager[0]}},@{ n = "LastLogonTimeStamp"; e = { [datetime]::FromFileTime( $_.lastLogonTimestamp ) } } | Export-Csv Users_Export.csv     
    
    