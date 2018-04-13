$a = Get-Date
$datum = $a.ToShortDateString()
$cas = " " + $a.ToShortTimeString()
$connection = Test-NetConnection -ComputerName neo -Port 3306
$stav = " State: " + $connection.TcpTestSucceeded

$resulToFile = $datum + $cas + $stav
$resulToFile | Out-File c:\support\Neo.txt -Append
