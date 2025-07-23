# check_env.sh
#!/bin/bash

MISSING=()

for cmd in node npm cordova java gradle convert; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    MISSING+=("$cmd")
  fi
done

if [ ${#MISSING[@]} -ne 0 ]; then
  zenity --error --text="Mancano i seguenti comandi richiesti:\n\n${MISSING[*]}"
  exit 1
fi
