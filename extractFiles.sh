#!/bin/bash

file=$1
output="out"

if [ -z "$file" ] || [ ! -f $file ]; then
    echo 'File not exist'
else
    typeFile=`file $file | cut -d ' ' -f2`
    
    case "$typeFile" in 
        'ARC') 
            echo $typeFile
            nomarch -p $file > $output
            ;;

        'PPMD')
            echo $typeFile
            ppmd d $file
            ;;

        'Microsoft')
            echo $typeFile
            cabextract $file
            ;;

        'bzip2')
            echo $typeFile
            bzip2 -d $file
            ;;

        'XZ')
            echo $typeFile
            unxz < $file > secret
            ;;

        '7-zip')
            echo $typeFile
            7z e $output
            ;;

        'gzip')
            echo $typeFile
            mv $typeFile out.gz
            gzip -d out.gz
            ;;

        'POSIX')
            echo $typeFile
            tar -xvf $file
            ;;

        'Zip')
            echo $typeFile
            unzip $file
            ;;

        'ARJ')
            echo $typeFile
            mv $file out.arj
            arj e out.arj
            ;;

        esac;

    echo $file
    echo $typeFile
fi
