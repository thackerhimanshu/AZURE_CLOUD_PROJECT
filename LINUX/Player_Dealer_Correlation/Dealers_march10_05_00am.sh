#!/bin/bash
#script for  march 10 with time loss and dealer #

echo "script has been ran sucessfully for 05:00am"

grep "0310" ./Player_Analysis/Roulette_Losses|grep '05:00:00 AM'|awk '{ print $1,$2,$3 }' >> Dealers_Working_during_losses  
grep '05:00:00 AM' ./Dealer_Analysis/MARCH10ROULETTESCHEDULE |awk '{ print $3,$4 }' >> Dealers_Working_during_losses


