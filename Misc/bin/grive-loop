#!/bin/bash
## PSF
# Vars

logsToKeep=15
logPath=~/Other/.log/grive-loop-log/

if [ $(pgrep -x "grive-loop" | wc -l) -ge 3 ]; then # 3 porque se encuentra a si mismo
	echo "Already running grive-loop."
	exit 1
fi

cd ~/Documents/Google\ Drive



while true; do

	sleep 15m

	if ! pgrep -x "grive" > /dev/null; then # checkeo que grive no este corriendo
		dateVar=$(date +%F)
		timeVar=$(date +%T)

		#echo 'Test'$dateVar'_'$timeVar

		nice -n 15 grive -l $logPath/gdrive-loop-log_$dateVar'_'$timeVar.log

	fi

	if [ $(ls $logPath/ | wc -l) -gt $logsToKeep ]; then 
		rm $logPath$(ls $logPath -t | tail -1) # Borro el archivo mas viejo
	fi



done
