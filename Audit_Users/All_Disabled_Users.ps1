#Show disabled users
Get-ADUser -Filter * -Property Enabled  | Where-Object {$_.Enabled -like "false"} | Format-Table Name, Enabled