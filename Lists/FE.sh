for x in {1..10}
do
    /usr/bin/time --format %U --output FE_RESULTS --append ./FE > /dev/null
done
