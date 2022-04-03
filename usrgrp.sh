#!/bin/bash

#comprovant de que ha sigut executat com a root
if [ $EUID -ne 0 ]
then 
	echo "El script se ha de usar con ROOT"
	exit 1
fi

#funcio menu
function menu {

while [ "$opción" != "s" ]
	do

	clear

	echo "#####3MENU######"
	echo " 1.Crea usuario"
	echo " 2.Crea grupo"
	echo " 3.Añade un usuario a un grupo"
	echo " 4.Quitar un usuario de un grupo"
	echo " 0.Salir del programa"
	echo "###----------###"
	read opcion
	case $opcion in

	0)
	echo "Saliendo..."
	return 0
	;;

	1)
	echo "Crear usuario"
	echo "Nombre del usuario a crear:"
	read user
	sudo adduser $user
	sleep 3
	;;

	2)
	echo "Crear grupo"
	echo "Nombre del grupo a crear:"
	read group
	sudo groupadd $group
	sleep 3
	;;

	3)
	echo "Añadir usuario a un grup"
	echo "Nombre del usuario:"
	read user2
	echo "Nombre del grupo:"
	read group2
	sudo addgroup $user2 $group2
	sleep 3
	;;

	4)
	echo "Quitar un usuario de un grupo"
	echo "Nombre del usuario:"
	read user3
	echo "Nombre del grupo:"
	read group3
	sudo gpasswd -d $user3 $group3
	sleep 3
	;;
	esac
	done
	return 0
}
function crusr {


	clear
	echo "echo ######Creación de un usuario nuevo######"
	echo "Nom de l'usuari:"
	read user4
	echo "UID del usuario:"
	read Uid1
	echo "Nombre del grupo:"
	read group4

	sudo useradd -d /home/$user4 -s /bin/bash -u $Uid1 -g $group4 $user4
	sleep 3
	return 0;
}
function cgrp {
	clear
	echo "echo ######Creacion de un grupo nuevo######"
	echo "Nombre del grupo:"
	read group5
	echo "GID del grupo:"
	read Gid1
	sudo addgroup --gid $Gid1 $group5
	sleep 3
	return 0	
}
function afegr {

	clear
	echo "echo ######Añadir usuario al grupo creado anteriormente######"
	echo "Nombre del usuario:"
	read user6

	sudo addgroup $user6 $group5
	sleep 3
	return 0
}
function esbgr {

	clear
	echo "echo ######Quitar usuario de un grupo######"
	echo "Nombre del usuario:"
	read user7
	echo "Nombre del grupo:"
	read group7

	sudo gpasswd -d $user7 $group7
	sleep 3
	return 0	
}
menu
exit 0 
