#!/bin/bash

ANACONDALINES=2
TEMPPATH=".anaconda_arg"

enable=false;

if [ -e ./EnableAnaconda.sh ]; then
    enable=true;
    echo "Enabling Anaconda"
else
    enable=false;
    echo "Disabling Anaconda"
    fi
#Do things


if [ "$enable" = true ]; then
    cat ./.local/share/$TEMPPATH >> ~/.bashrc
    rm ./.local/share/$TEMPPATH
    echo "Creating DisableAnaconda.sh"
    mv ./EnableAnaconda.sh ./DisableAnaconda.sh
else
    in=`grep -n "added by Anaconda" ~/.bashrc`

    #Get the line numbers from the grep output
    linenum=${in%:*}

    #copy the lines into a new temporary file
   cat ~/.bashrc | sed -e $linenum,$((linenum+ANACONDALINES-1))!d > ./.local/share/$TEMPPATH
    
    #remove lines from .bashrc
   cat ~/.bashrc | sed -e $linenum,$((linenum+ANACONDALINES-1))d > ~/.bashrx
   mv ~/.bashrx ~/.bashrc
   echo "Creating EnableAnaconda.sh"
   mv ./DisableAnaconda.sh ./EnableAnaconda.sh
fi
