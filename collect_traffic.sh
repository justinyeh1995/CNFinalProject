#!/bin/bash
n=6     # number of switches
for i in {1..1000}
do
    for ((j = 1; j <= n; j++))
    do
        echo "Inspection no. $i at s$j"
        # extract essential data from raw data
        sudo ovs-ofctl dump-flows s$j > data/raw
        grep "nw_src" data/raw > data/flowentries.csv
        packets=$(awk -F "," '{split($4,a,"="); print a[2]","}' data/flowentries.csv)
        bytes=$(awk -F "," '{split($5,b,"="); print b[2]","}' data/flowentries.csv)
        ipsrc=$(awk -F "," '{out=""; for(k=2;k<=NF;k++){out=out" "$k}; print out}' data/flowentries.csv | awk -F " " '{split($11,d,"="); print d[2]","}')
        ipdst=$(awk -F "," '{out=""; for(k=2;k<=NF;k++){out=out" "$k}; print out}' data/flowentries.csv | awk -F " " '{split($12,d,"="); print d[2]","}')

        # check if all the strings are of length 0; then there are no traffics in the network at the moment.
        if test -z "$packets" || test -z "$bytes" || test -z "$ipsrc" || test -z "$ipdst" 
        then
            state=0
        # if traffics detected then start inspect the situation.
        else
            echo "$packets" > data/packets.csv
            echo "$bytes" > data/bytes.csv
            echo "$ipsrc" > data/ipsrc.csv
            echo "$ipdst" > data/ipdst.csv
        
            python3 computeRTData.py
            python3 inspector.py
            state=$(awk '{print $0;}' .result)
	fi

        if [ $state -eq 1 ];
        then
            echo "Network is under attack occuring at s$j"
            default_flow=$(sudo ovs-ofctl dump-flows s$j | tail -n 1)    # Get flow "action:CONTROLLER:<port_num>" sending unknown packet to the controller
            sudo ovs-ofctl del-flows s$j
            sudo ovs-ofctl add-flow s$j "$default_flow"
        fi
    done
    sleep 3
done

