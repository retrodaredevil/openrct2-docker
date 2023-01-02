#!/bin/bash

save_file=$(ls -t /app/game/save/autosave/* 2>/dev/null | head -n1)

if [ ! -f "$save_file" ]; then
  printf "Save file does not exist! save_file: $save_file\n"
  exit 1
fi

openrct2-cli scan-objects --user-data-path="/app/game"
openrct2-cli host "$save_file" --user-data-path="/app/game" $@
