#!/bin/bash
ts=$(gdate +%s%N)
for (( i = 0; i < 30; i++)); do 
    wget -q http://$@:8000 -O- >> /dev/null &
done
wait
tt=$((($(gdate +%s%N) - $ts)/30000000))
echo "Temps moyen des requêtes : $tt ms"