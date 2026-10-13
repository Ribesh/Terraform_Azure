**GRS** stands for ***Geo-Redundant Storage***. It replicates your data synchronously within the primary region and asynchronously to a secondary Azure region for disaster recovery.
Other supported replication options include:
- LRS — Locally redundant storage
- ZRS — Zone-redundant storage
- GRS — Geo-redundant storage
- GZRS — Geo-zone-redundant storage
- RAGRS — Read-access geo-redundant storage
- RAGZRS — Read-access geo-zone-redundant storage



>**Important**: address_space belongs to the VNet; address_prefixes belongs to the subnet. The subnet doesn't create a new VNet.

>A **service endpoint** enables a subnet to connect directly to supported Azure services over the ***Azure backbone network***. It also lets the Azure service identify traffic from that subnet for network access rules. 

Here's what each value means:
|Service endpoint|Purpose|
|---|---|
|Microsoft.Sql|Enables service endpoint connectivity to supported Azure SQL services.|
|Microsoft.Storage|Enables service endpoint connectivity to Azure Storage accounts in the same region as the VNet.|
|Microsoft.Storage.Global|Enables service endpoint connectivity to Azure Storage accounts across regions.|


_

>**virtual_network_subnet_ids** tells Azure to allow traffic from the specified subnet.
	
	
	
	