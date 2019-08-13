import-csv .\Users1.csv | Where-Object {$_ -match "WOWTESTDC1" -or $_ -match "tlnpgid01"} | Out-File UsersOut.csv -Verbose

