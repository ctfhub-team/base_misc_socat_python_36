#!/bin/bash

if [[ -f /flag.sh ]]; then
    source /flag.sh
fi

chown -R root:ctf /home/ctf/
chmod -R 750 /home/ctf/

echo "Start Run Socat"
echo "[Debug] " socat tcp-listen:10000,fork,su=nobody EXEC:"$COMMAND"$EXTRA
exec socat -v tcp-listen:10000,fork,reuseaddr,su=ctf EXEC:"$COMMAND"$EXTRA
