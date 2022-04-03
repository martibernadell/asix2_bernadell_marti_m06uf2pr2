#!/bin/bash
#Martí Bernadell Navarro
clear
echo "PROGRAMA esb.sh"
case $1 in 
	-e) if (( $# != 3 ))
		then
			echo "Incorrecte"
			echo "L'opció -e necessita 3 paràmetres"
			echo "La primera opció és -e"
			echo "La segona opció és la extensió dels fitxers a enviar a la paperera"
			echo "La tercera opció és el directori a on es troben els fitxers a enviar a la paperera"
			exit 2
		fi
		if [[ ! -d ~/paperera ]]
		then
			mkdir ~/paperera
		fi
		if [[ ! -d $3 ]]
		then
			echo "La carpeta no existeix"
		else
			if [[ $(ls -A $3/*.$2 2> /dev/null | wc -l) -ne 0 ]]
			
			then
				mv $3/*.$2 ~/paperera
				echo "Fitxers enviats a la paperera"
			else
				echo "Els fitxers amb l'extensió indica no existeixen"
			fi
		 fi
		 ;;	 
	-r) if (( $# != 1 )) 
		then
			echo "Nombre de paràmetres incorrecte"
			echo "L'opció -r no necessita altres paràmetres"
			exit 1
		fi
		if [[ ! -d ~/paperera ]]
		then
			echo "La paperera encara no existeix"
		else
			if [[ $(ls -A ~/paperera | wc -l) -ne 0 ]]
		
			then
				rm ~/paperera/* 
				echo "Paperera buidada"
			else
				echo "La paperera ja està buida" 
			fi
		fi
		;;	
	*)  echo "Primer paràmetre incorrecte"
	    echo "Utilització: "
	    echo "-r per buidar la paperera"
	    echo "-e per enviar fitxers a la paperera"
	    exit 3
	    ;;
esac
exit 0
