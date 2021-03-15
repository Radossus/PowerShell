$rg = 'arm-infrastructure-easy'
New-AzResourceGroup -Name $rg -Location northeurope -Force

New-AzResourceGroupDeployment `
    -Name 'new-storage' `
    -ResourceGroupName 'arm-infrastructure-easy' `
    -TemplateFile '01-storage.json' `
    -storageName 'storageaccnoutmatric' `
    -storageSKU 'Standard_LRS'