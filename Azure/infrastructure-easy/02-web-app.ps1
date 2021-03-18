$rg = 'arm-infrastructure-easy'
New-AzResourceGroup -Name $rg -Location northeurope -Force

    New-AzResourceGroupDeployment `
    -Name 'new-server' `
    -ResourceGroupName 'arm-infrastructure-easy' `
    -TemplateFile 'web-farm.json' `
    -planName 'plan1' `
    -webAppName 'webAppName1' `
    -location 'westeurope'