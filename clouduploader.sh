#!/bin/bash
set -e

#CONTAINER=aaa
#STORAGE_ACCOUNT=alja

source CONF
source funciones/check_file.sh
source funciones/check_cloud.sh


files_exists $@
check_storage_account $STORAGE_ACCOUNT
check_container $CONTAINER $STORAGE_ACCOUNT

#SOLO ARCHIVOS QUE NO EXISTEN

for file in "${@}"; do
	check_blob_exists $file  $CONTAINER $STORAGE_ACCOUNT
	if [ $blob_exists = false ]; then
		echo "subiendo $file"		
		az storage blob upload --file $file --container-name $CONTAINER  --name $file --account-name $STORAGE_ACCOUNT  --auth-mode login 
		check_blob_exists $file  $CONTAINER $STORAGE_ACCOUNT
	
		if [ $blob_exists = true ]; then
			echo "archivo ${file} subido"
		
		else
			echo "archivo ${file} no se ha subido "
		fi
	fi

done


