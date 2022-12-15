### Environment Setups
- Install `ryu`
- Install `mininet`

### How to run this code

Open three sperate shells:

`shell 1`:
- Create a virtual environment via Python: ```python3 -m venv venv```.
- Install pakages with ```pthon3 -m pdb pip install -r requirements.txt```
- Activate the virtual environment ```venv```: 
```source venv/bin/activate```
- Create a mininet topology
```sudo mn -c && sudo python3 mininet_topo.py```
- Inside the mininet shell, start the DDoS Attack on h1 from h2 by running: ```
```h2 flood_attack.sh```

`shell 2`:
** run this after clearing mininet topology
Start the Ryu controller by running: ```ryu-manager controller.py```
`shell 3`:
- Activate the virtual environment ```venv```: 
```source venv/bin/activate```
Start the collecting and inspecting program by running: ```source collect_traffic.sh```

