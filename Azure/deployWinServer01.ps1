# create a resource group
New-AzResourceGroup -Name myResourceGroup -Location EastUS

# create the virtual machine 
# when prompted, provide a username and password to be used as the logon credentials for the VM
New-AzVm `
    -ResourceGroupName "myResourceGroup" `
    -Name "myVM" `
    -Location "East US" `
    -VirtualNetworkName "myVnet" `
    -SubnetName "mySubnet" `
    -SecurityGroupName "myNetworkSecurityGroup" `
    -PublicIpAddressName "myPublicIpAddress" `
    -OpenPorts 80,3389

#Retrieve the public IP address of the machine.
#
#Get-AzPublicIpAddress -ResourceGroupName "myResourceGroup" | Select "IpAddress"
#Create an RDP session from your local machine. Replace the IP address with the public IP address of your VM. This command runs from a cmd window.
#
# mstsc /v:publicIpAddress