rm FE_RESULTS TE_HAND_RESULTS TE_SUCHTHAT_RESULTS RESULTS

./TE_hand.sh
printf "Type encoding hand mean: " >> RESULTS
cat TE_HAND_RESULTS | awk '{sum+=$1; n++} END {print sum/n}' >> RESULTS
printf "\nType encoding hand standard deviation: " >> RESULTS
cat TE_HAND_RESULTS | awk '{x+=$1; y+=$1*$1; n++} END {print sqrt(y/n-(x*x/(n*n)))}' >> RESULTS

./TE_suchThat.sh
printf "\nType encoding suchThat mean: " >> RESULTS
cat TE_SUCHTHAT_RESULTS | awk '{sum+=$1; n++} END {print sum/n}' >> RESULTS
printf "\nType encoding suchThat standard deviation: " >> RESULTS
cat TE_SUCHTHAT_RESULTS | awk '{x+=$1; y+=$1*$1; n++} END {print sqrt(y/n-(x*x/(n*n)))}' >> RESULTS

./FE.sh
printf "\nFunction encoding mean: " >> RESULTS
cat FE_RESULTS | awk '{sum+=$1; n++} END {print sum/n}' >> RESULTS
printf "\nFunction encoding standard deviation: " >> RESULTS
cat FE_RESULTS | awk '{x+=$1; y+=$1*$1; n++} END {print sqrt(y/n-(x*x/(n*n)))}' >> RESULTS
