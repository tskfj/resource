# Get a virtual network from the network team

# Create resources
$location = "Japan east"
$rg = "myrg"
New-AzResourceGroup -Name $rg -Location $location
New-AzSearchService -ResourceGroupName $rg -Name "mysearch" -Sku "Standard" -Location $location -PartitionCount "1" -ReplicaCount "1" -IdentityType "SystemAssigned"
New-AzStorageAccount -ResourceGroupName $rg -Name "mystorage" -Location $location -SkuName "Standard_LRS" -Kind "Storage"

<#
Create below resources using Azure Portal
  Enable a Private Endpoint of Search Service
  Enable a Service Endpoint of Storage Account

  Get Azure Policy built-in policy definitions
    policy_01 = "Azure Cognitive Search services should disable public network access"
    policy_02 = "Azure Cognitive Search services should use private link"
    policy_03 = "Storage accounts should restrict network access using virtual network rules"
    policy_04 = "Storage Accounts should use a virtual network service endpoint"
  Create policy assignments
#>

# skip Azure OpenAI Service
