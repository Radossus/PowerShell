param($jmenoProcesu)
if($jmenoProcesu){
    Get-Process -Name $jmenoProcesu
}else {
    Write-Output "Při volání skriptu musí být zadán vstupní parametr 'Jméno procesu'!"
}

