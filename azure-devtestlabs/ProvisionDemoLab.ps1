$ErrorActionPreference = "stop"

$ResourceGroupName = "rg-ADP-2018-Demos"
$ResourceGroupLocation = "West Europe"
$subscriptionName = "Containers"

# Login and select subscription
try { Get-AzureRmContext } catch { Login-AzureRmAccount }
Select-AzureRmSubscription -SubscriptionName $subscriptionName

"Creating new resource group for the lab..."
New-AzureRmResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation -Force

"Start deploying the lab using the ARM templates..."
New-AzureRmResourceGroupDeployment `
    -Name "DevTesLab-Demo" `
    -ResourceGroupName $ResourceGroupName `
    -TemplateFile .\azuredeploy.json `
    -TemplateParameterFile .\azuredeploy.parameters.json `
    -Verbose