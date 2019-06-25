<#function get-ObecnaData {
    
    # Vstup uzivatele
    param(
        [Parameter()]
        [Alias('cn','pc')]
        $ComputerName,
        [Parameter()]
        [Alias('cl')]
        $Class
    )
    "Computer Name: $computerName"
    "Class: $class"
   
} #>

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

