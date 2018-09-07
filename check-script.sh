#!/bin/sh

if [ $1 == "Login-User" ]
then
	echo "Reply-Message = 'OK'"
	exit 0
else
	echo "Reply-Message = 'NO'"
	exit 1
fi
