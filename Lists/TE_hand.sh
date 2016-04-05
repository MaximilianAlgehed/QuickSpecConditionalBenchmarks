for x in {1..100}
do
    /usr/bin/time --format %U --output TE_HAND_RESULTS --append ./TE_hand > /dev/null
done
