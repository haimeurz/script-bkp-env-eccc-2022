#!/bin/bash


bkp () {
    echo 'Commencement du script qui cree le backup de votre environnement....'
# Je cree une directory cachée ou il y aura mon backup si elle nexiste pas 
    /bin/mkdir -p ~/.env_bkp
    /bin/rm -f ~/.env_bkp/*
# je sauvegarde loutput de la commande dans txt file si le file existe deja il va le ovewrite
# jenleve les fonctions dans mon fichier txt du output de env
    /usr/bin/env | /usr/bin/perl -0777 -pe s'/[{].*[}]//'sg | /usr/bin/perl -pe s'/.*?=\(\).*\n//'g |/usr/bin/sort > ~/.env_bkp/${HOST}_${USER}_init.txt
    echo "Votre backup initial est fini dans ~/.env_bkp/${HOST}_${USER}_init.txt!" 

}


unsetVar () {
    # POUR RUN LE CODE IL FAUT LE RUN EN MODE SOURCE POUR CONSERVER UN SHELL STABLE 
    # . unset.sh

    #Je cree un fichier txt de la commande env qui a juste les variables et aucune fonction 
    /usr/bin/env | /usr/bin/perl -0777 -pe s'/[{].*[}]//'sg | /usr/bin/perl -pe s'/.*?=\(\).*\n//'g |/usr/bin/sort > ~/.env_bkp/${HOST}_${USER}_current.txt

    OLD_IFS=$IFS
    IFS=$'\n'

    # Je passe par tous les variables dans mon fichiers et je les unset sauf pour le host et le user ,car ca rendra
    # l'environnement instable
    for v in `/bin/cat ~/.env_bkp/${HOST}_${USER}_current.txt`;
        do 
            var=$(echo $v | /usr/bin/cut -d '=' -f1) 
            if [[ $var == "USER" || $var == "HOST" ]]; then
            :
            else
                unset $var
            fi
    done
    IFS=$OLD_IFS
    echo "Variables unset!"

}


initVar () {
    # POUR RUN LE CODE IL FAUT LE RUN EN MODE SOURCE POUR CONSERVER UN SHELL STABLE 
   OLD_IFS=$IFS
   IFS=$'\n'
   for v in `/bin/cat ~/.env_bkp/${HOST}_${USER}_init.txt`;
   do 
       export $v   
   done
   IFS=$OLD_IFS
   echo "variables reinitialized!"
    
}

while :
do
    case $1 in
        "-backup") 
            bkp
            break
            ;;
        "-reset")
            unsetVar && initVar
            break
            ;;
        "--help")
            echo "Usage: . ~/run.sh [OPTION]
Keep a copy of your initial environment variables and you are also able to reset your variables after you use some
packages that change your initial variables. Pls backup your environment variables first!!! DONT FORGET TO RUN THE SCRIPT IN SOURCE!

  -backup, backup your environment variables
  -reset,  'unset' your current environment variables and set it to the one with you have in your backup
  --help    display this help and exit
"
            break
            ;;
            *)
            echo "You have failed to specify what to do correctly. type --help to display help and exit"
            break
            ;;
    esac
done





