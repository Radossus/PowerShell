#You have to use Enable-PSRemoting to enable Windows PowerShell remoting on Servers!
function Get-InfoOS {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True)][string]$ComputerName
    )
    $os = Get-CimInstance -class Win32_OperatingSystem -ComputerName $ComputerName
     $props = @{'Windows'=$os.Name;
         'OSVersion'=$os.version;
     'SPVersion'=$os.servicepackmajorversion;
     'OSBuild'=$os.buildnumber}
     New-Object -TypeName PSObject -Property $props
}

function Get-InfoCompSystem {
    [CmdletBinding()]
    param(
    [Parameter(Mandatory=$True)][string]$ComputerName
    )
    $cs = Get-CimInstance -class Win32_ComputerSystem -ComputerName $ComputerName
    $props = @{'Model'=$cs.model;
    'Manufacturer'=$cs.manufacturer;
    'RAM (GB)'="{0:N2}" -f ($cs.totalphysicalmemory / 1GB);
    'Sockets'=$cs.numberofprocessors;
    'Cores'=$cs.numberoflogicalprocessors}
    New-Object -TypeName PSObject -Property $props
}

function Get-InfoBadService {
    [CmdletBinding()]
    param(
    [Parameter(Mandatory=$True)][string]$ComputerName
    )
    $svcs = Get-CimInstance -class Win32_Service -ComputerName $ComputerName `
    -Filter "StartMode='Auto' AND State<>'Running'"
    foreach ($svc in $svcs) {
    $props = @{'ServiceName'=$svc.name;
    'LogonAccount'=$svc.startname;
    'DisplayName'=$svc.displayname}
    New-Object -TypeName PSObject -Property $props
    }
}

function Get-InfoProc {
    [CmdletBinding()]
    param(
    [Parameter(Mandatory=$True)][string]$ComputerName
    )
    $procs = Get-CimInstance -class Win32_Process -ComputerName $ComputerName
    foreach ($proc in $procs) {
    $props = @{'ProcName'=$proc.name;
    'Executable'=$proc.ExecutablePath}
    New-Object -TypeName PSObject -Property $props
    }
}

function Get-InfoNIC {
    [CmdletBinding()]
    param(
    [Parameter(Mandatory=$True)][string]$ComputerName
    )
    $nics = Get-CimInstance -class Win32_NetworkAdapter -ComputerName $ComputerName `
    -Filter "PhysicalAdapter=True"
    foreach ($nic in $nics) {
    $props = @{'NICName'=$nic.servicename;
     'Speed'=$nic.speed / 1MB -as [int];
     'Manufacturer'=$nic.manufacturer;
     'MACAddress'=$nic.macaddress}
    New-Object -TypeName PSObject -Property $props
    }
}



