#!/bin/bash

GITREPO=$(git remote get-url origin)


getIgnore () {
	if [ -f ".gitignore" ]; then
		echo -n "✅"
	else
		echo -n "❌"
		echo "[WARNING]: A .gitignore is recommended!! ⚠️"
		echo ""
		exit 1
	fi
}

normaReport () {
	DATE=$(date +%d-%m-%Y)
	norminette * >> report-$DATE.txt
	echo ""
	cat ./*report*.txt
}

if [ $# -eq 0 ]; then
	echo -e "[ERROR]: NO COMMIT COMMENT WAS PASSED ❌"
else
	clear
	echo "[STATUS]: Checking if a repository is set! ✨"
	sleep 2
	if [ -d ".git" ]; then
		echo "[STATUS]: Repository: $GITREPO ✅"
		sleep 1
		echo "[STATUS]: Is there a .gitignore? $(getIgnore)"
		sleep 1
		echo "[STATUS]: Requesting Norminette results!"
		sleep 2
		echo "[STATUS]: Norminette Report: $(normaReport)"i
		sleep 1
		echo "[STATUS]:"
		
	else
		echo ""
		echo "[ERROR]: No repository was setted up! ❌"
	fi
fi
