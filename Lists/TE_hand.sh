for x in {1..100}
do
    /usr/bin/time --format %U --output TE_HAND_RESULTS --append runhaskell TE_hand.hs > /dev/null
done
