#!/bin/bash 


function GetRandom() { 

    # create an array for storage (note: for larger sets, this may be slow)

    WordsDict="$PWD/inputWords.txt" 
    
    if [ ! -x $WordsDict ]; then 
    
        while read -r line; do 
            words+=("$line")
        done < $WordsDict 

    for ((i=0; i<=${#words[@]}; i++))
    do
        size=${#words[@]}
        index=$(($RANDOM % $size))
        echo " $i ${words[$index]}"
    done 
    
    else 
        echo "Can't find the Dictionary! check your path?" 
        exit -1 
    fi 

}

time { 
for ((i=0; i<=10000; i++))
{

    GetRandom >> out.txt 
    echo "Trial ID: $i"

}    
} 
echo "Done."