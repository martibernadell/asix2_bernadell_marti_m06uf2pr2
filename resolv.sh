#!/bin/bash
#Martí Bernadell Navarro
echo "Dona'm un subdirectori per fer una copia de seguretat"
echo
if (( $# == 1 ))
then
	if [[ ! -d /root/$1 ]]
	then
		echo -n "El subdirectori no existeix. El vols crear? (s/n)?: "
		read opc
	if [[ $opc != "s" ]] && [[ $opc != "S" ]]
	then
			echo $opc
			echo "No es crea el directori"
			exit 1
	else
			mkdir /root/$1
		fi
	fi
else
	echo "S'ha de passar un paràmetre. El paràmetre és una carpeta dins de /root"
			exit 2
	fi
nom_backup=/root/$1/resolv.conf.backup.$(date +"%Y%m%d%H%M")
cp /etc/resolv.conf $nom_backup 
gzip $nom_backup
			exit 0
