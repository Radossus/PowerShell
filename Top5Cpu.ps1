Get-process | sort-object -Property CPU -Descending | Select-Object -First 5 -Property Name, CPU | ConvertTo-Html | Out-File C:\temp\Top5Cpu.html
