# prepare input
cat data.origin | sed -e 's/\([[:space:]]\)/\_/g' | sed -e 's/\(.\)/\1 /g' | sed '1s/^/\n/' > data.input 
# create a raw channel model
./create-fst.sh > channel.fst
# train the channel model
carmel --train-cascade -HJ -1 -M 1000 -X 0.999999 -? data.input english.s channel.fst
# prepare Viterbi decoding
carmel --project-right --project-identity-fsa -HJ english.s > language.fsa.result.noe
awk 'NF>0' data.input > data.input.noe
# decipher with Viterbi decoding
cat data.input.noe | carmel -qbsriWIEk 1 --exponents=1,3,1 language.fsa.result.noe channel.fst.trained > data.output
# decode output
cat data.output | sed -e 's/\s//g' | sed -e 's/\_/ /g' > data.plaintext
