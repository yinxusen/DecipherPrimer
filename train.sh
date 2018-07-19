# $1: untrained fst
# $2: trained fst
# $3: training corpus

carmel -t -HJ -: -! 10 -1 -M 1000 -X 0.99999 $3 $1 > $2
