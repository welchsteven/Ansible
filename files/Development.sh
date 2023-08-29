#!/bin/bash
my_link=~/Development

if [ -L ${my_link} ] ; then
   if [ -e ${my_link} ] ; then
      echo "Good link to Development"
   else
      echo "Broken link to Development"
   fi
elif [ -e ${my_link} ] ; then
   echo "Not a link"
else
   echo "Link Missing: Installing Link"
   ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/Development ~/
fi

