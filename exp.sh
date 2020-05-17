#!/bin/bash


if [ $1 == "show" ]
then
    # show all screens
    screen -ls
elif [ $1 == "create" ]
then
    # create screen and enter
    screen -S $2
    screen -dr $2
elif [ $1 == "alloc" ]
then
    # allocate gpu
    srun -p dell --ntasks=16 --gres=gpu:V100:$2 --pty bash
elif [ $1 == "enter" ]
then
    screen -dr $2
elif [ $1 == "rename" ]
then
    # rename screen
    screen -S $2 -X sessionname $3
elif [ $1 == "kill" ]
then
    # kill screen
    screen -SX $2 quit
fi