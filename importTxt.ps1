#Imports TXT file and replace some strings and saving.
(Get-Content -Path C:\ReplaceDemo.txt -Raw) -replace 'UMN','RRR' | Set-Content -Path C:\ReplaceDemo.txt

  

