#!/bin/bash
a[0]="142.250.76.78"
a[1]="216.58.196.174"
a[2]="172.217.163.46"
a[3]="172.217.31.206"

# we can also store ip addresses  in "text file"  instead of array

minhops=100000000000000

for i in "${a[@]}"
do
    #hops counting   
    hops=$(traceroute -I $i | wc -l)
    echo "$i"
    echo "$hops"

    #for finding minimum hops
    if [ $hops -le $minhops ]
    then
    minhops=$hops
    ip=$i
    fi
done
echo "ip address with min no.of hops is: $ip"
echo "min.hops: $minhops"

# To display website
firefox "$ip"
