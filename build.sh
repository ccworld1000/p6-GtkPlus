#!/bin/bash

if [ "$1" == "new" ]; then
  rm LastBuildResults*
else
  perl6 scripts/backup_results.pl6
fi
for a in `cat BuildList`; do
  (echo " === $a ==="; perl6 --stagestats -Ilib -e "use $a") | tee -a LastBuildResults
done
