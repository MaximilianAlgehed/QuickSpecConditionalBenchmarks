rm FE_RESULTS TE_HAND_RESULTS TE_SUCHTHAT_RESULTS
./TE_hand.sh
echo "Type encoding hand: " >> RESULTS
cat TE_HAND_RESULTS | awk '{sum+=$1; n++} END {print sum/n}' >> RESULTS
./TE_suchThat.sh
printf "\nType encoding suchThat: " >> RESULTS
cat TE_SUCHTHAT_RESULTS | awk '{sum+=$1; n++} END {print sum/n}' >> RESULTS
./FE.sh
printf "\nFunction encoding: " >> RESULTS
cat FE_RESULTS | awk '{sum+=$1; n++} END {print sum/n}' >> RESULTS
