#!/bin/bash
# Script Administracion De Usuarios Y Grupos
clear
echo "Bienvenido al menu de administracion usuarios y grupos"
echo "por favor ingrese la opcion  correspondiente:"
echo "1 . Creacion usuarios"
echo "2 . Eliminar usuarios"
echo "3 . Crear grupos"
echo "4 . Remover usuario de un grupo"
echo "5 . Eliminar grupos"
echo "6 . Salir"
read option
clear
# Punto 1 "Creacion usuarios"
if [ $option = 1 ];
        then
        echo " Ingresa el nombre del usuario que vas a crear"
        read user1
        echo " ¿Deseas agregar tu usuario a grupos especificos ? si/no "
        read esp1
        	if [ $esp1 = si ];
       		 then
       		 echo " Ingresa el nombre del grupo secundario para tu usurio "
        	read gru2
        	groupadd $gru2
        	echo " Ingresa el nombre del grupo primario para tu usurio "
        	read gru1
        	groupadd $gru1
        	fi
			if [ $option != si ];
			then
			echo " El usuario no se ha agregado a nada"
			fi
       				 echo " ¿ Estas seguro de crear a $user1 ? si/no "
        			read confirma
        			if [ $confirma = si ];
        			then
        			useradd $user1
        			echo " El usuario $user1 ha sido creado "
        			fi
        				if [ $esp1 = si ];
        				then
        				usermod $user1 -g $gru1 -G $gru2
        				echo " El usuario $user1 ha sido creado "
					fi
						if [ $confirma != si ];
        					then
        					echo "El usuario NO ha sido creado"
        					fi
	
fi
# Punto 2 "Eliminar usuarios"
if [ $option = 2 ];
then
	echo "Ingrese usuario a eliminar"
	read usuario2
	echo "¿Está seguro de querer eliminar al $usuario2? S/N"
	read confirmacion
	if [ $confirmacion = S ];
	then
	userdel -rf $usuario2
	else [ $confirmacion = N ];
	echo "El usuario ha sido eliminado"	
	fi	
fi

# Punto 3 "Craer grupos"
if [ $option = 3 ];
then
	echo "Ingrese nombre del grupo que desea crear"
	read grupo
	echo " Esta seguro que desea crear el $grupo (si o no) "
	read opcion
		if [ $opcion = si ];
		then 
		groupadd $grupo 
		echo "El grupo ha sido creado"
		fi
fi
# Punto 4 "Remover usuario de un grupo"
if  [ $option = 4 ];
then
	echo "Ingrese nombre de usuario a remover"
	read usuario3
	echo "Ingrese nombre de grupo a remover"
	read grupo5
	echo "¿Está seguro de realizar esta operacion?"
	read remover
	if [ $remover = S ];
	then
	gpasswd  -d  $usuario3 $grupo5
	echo "Operacion realizada"
	else [ $remover = N ];
	fi
fi
# Punto 5 "Eliminar grupos"
if [ $option =  5 ];
then
	echo "Ingrese nombre de grupo a eliminar"
	read grupo6
	echo "¿Está seguro de querer eliminar el grupo? S/N"
	read elimgrupo
	if [ $elimgrupo = S ];
	then
	groupdel $grupo6
	echo "Operacion realizada"
	else [ $elimgrupo = N ];
	fi
fi
  
# Punto 6 "Salir"
if [ $option = 6 ];
	then
	echo "Muchas gracias por utilizar este Script"
fi

