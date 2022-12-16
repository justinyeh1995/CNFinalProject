# Computer Networks Final project
This is the repository for the final project for computer networks class at Vanderbilt.

## Problem Statement 
Distributed Denial of Service (DDoS) attacks are a major threat to the availability of online services. DDoS
attacks involve the coordinated use of multiple devices to flood a server or network with requests, overwhelming its capacity and rendering it inaccessible to legitimate users. Traditional DDoS detection methods,
such as signature-based detection and threshold-based detection, have proven inadequate in dealing with
increasingly complex and sophisticated DDoS attacks.
Machine learning (ML) offers a promising alternative for DDoS detection. ML algorithms can automatically
learn from data to identify patterns and anomalies that are indicative of a DDoS attack. This allows them to
adapt to the evolving nature of DDoS attacks and provide more accurate and effective detection [2].
In this research, we explore the use of ML and SDNs for DDoS detection. For our SDN controller, we opted
for Ryu. Ryu Controller is an open, software-defined networking (SDN) Controller designed to increase
the agility of the network by making it easy to manage and adapt how traffic is handled. In general, the
SDN Controller is the brain of the SDN environment, communicating information down to the switches
and routers with southbound APIs, and up to the applications and business logic with northbound APIs.
We begin by surveying the current state of the art in DDoS detection and highlighting the limitations of
traditional methods. We then discuss the potential of ML for DDoS detection and review recent research on
the use of ML for this purpose.
### Environment Setups
- Install `ryu` with ```python3 -m pip install ryu```
- Install `mininet`

- Create a virtual environment with ```python3 -m venv venv```.
- Install pakages in `venv` with ```pthon3 -m pdb pip install -r requirements.txt```
### How to run this code

Open three sperate shells:

`shell 1`:
- Activate the virtual environment ```venv```: 
```source venv/bin/activate```
- Create a mininet topology
```sudo mn -c && sudo python3 mininet_topo.py```
- Inside the mininet shell, start the DDoS Attack on h1 from h2 by running: ```
```h2 flood_attack.sh```

`shell 2`:

** run this after clearing mininet topology
- Start the Ryu controller by running: ```ryu-manager controller.py```

`shell 3`:
- Activate the virtual environment ```venv```: 
```source venv/bin/activate```
- Start the collecting and inspecting program by running: ```source collect_traffic.sh```

