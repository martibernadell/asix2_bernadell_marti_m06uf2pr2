#!/bin/bash
clear

echo -n "Indica la quantitat d'usuaris entre 1 y 100: "
read qt
if [[ $qt -lt 1 ]] || [[ $qt -gt 100 ]]
then
	echo "Error. Ha d'estar entre 1 i 100"
	exit 1
fi
echo -n "Indica el valor de l'uidNumber: "
read vinic

echo -n "Introdueix la contrasenya admin de ldap: "  
read -s ctsAdm
echo

if [[ -e esborraUsuaris.ldif ]]
then
    rm esborraUsuaris.ldif
fi

NumUsr=$vinic
for (( i=1; i<=$qt; i++))

do
    idUsr=usr$NumUsr

    echo "dn: uid=$idUsr,cn=UsuarisDomini,ou=UsuarisGrups,dc=fjeclot,dc=net" >> esborraUsuaris.ldif
    echo "changetype: delete" >> esborraUsuaris.ldif
    echo "" >> esborraUsuaris.ldif
    ((NumUsr++))
    
done

ldapmodify -h localhost -x -D "cn=admin,dc=fjeclot,dc=net" -w $ctsAdm -f esborraUsuaris.ldif
exit 0
