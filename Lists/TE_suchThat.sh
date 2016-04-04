for x in {1..100}
do
    /usr/bin/time --format %U --output TE_SUCHTHAT_RESULTS --append runhaskell TE_suchThat.hs > /dev/null
done
