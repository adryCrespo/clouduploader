#!/bin/bash

check_storage_account(){
	local respuesta=$(az storage account check-name -n "$1" )
	local available_account=$( jq '.nameAvailable'<<<"${respuesta}")
	if [[ "$available_account" == false  ]];then
		existe_account=true
		local available_account=$( jq '.nameAvailable'<<<"${respuesta}")
		echo "az account ${1} existe"
	else
		existe_account=false
		echo "az account ${1} no existe, fin de programa"
		exit 1
	fi
   
#echo "$respuesta"
#echo "az account existe: ${existe_account}"
}

#check_storage_account "$1"


check_container(){
	local container="$1"
	local account_name="$2"
	local respuesta=$(az storage container exists -n $container  --account-name $account_name --auth-mode login)		
	
	local available_account=$( jq '.exists'<<<"${respuesta}")
	if [[ "$available_account" == true  ]] ; then
		echo "container ${container} existe"
	else
		echo "container ${container} no existe"
		exit 1	
	fi
}

#check_container $1 $2



check_blob_exists(){
	local container="$2"
	local account_name="$3"
	local blob_name="$1"
	blob_exists=$(az storage blob exists -n $blob_name -c $container --account-name $account_name --auth-mode login | jq '.exists')
	
	if [[ "$blob_exists" == true  ]] ; then
		echo "archivo ${blob_name} existe en ${container}"
		
	
	fi

}

#check_blob_exists $1 $2 $3
