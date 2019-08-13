<#
.Synopsis
This is brief comments
.Description
This is the long comments
.Parameter ComputerName
This is the name of remote compter
.Example
Connection to local computer
getFreeSpaceOdDisk -computername localhost
.Example
Connection to remote computer
getFreeSpaceOfDisk -computername DC
#>
param(
    [Parameter(Mandatory=$true)]
    [string[]]$computername = 'localhost'
)

Get-CimInstance -ComputerName $computername -ClassName Win32_LogicalDisk -Filter "DeviceID='c:'" | 
    Select-Object -Property @{name="ComputerName";Expression={$_.PSComputerName}}, 
        @{name="FreeGB";Expression={$_.freeSpace / 1gb -as [int]}}
