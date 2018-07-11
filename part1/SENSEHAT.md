*Quick links :*
[Home](/README.md) - [**Part 1**](/part1/README.md) - [Part 2](/part2/README.md) - [Part 3](/part3/README.md) - [Part 4](/part4/README.md)
***
**Part 1** - [Setup](/part1/PREREQ.md) - [First Flow](/part1/FIRSTFLOW.md) - [Install Nodes](/part1/INSTALLNODE.md) - [Node-RED Context](/part1/CONTEXT.md) - [Sensors](/part1/SENSORS.md) - [**SenseHAT**](/part1/SENSEHAT.md) - [Additional Nodes](/part1/ADDITIONALNODES.md) - [Cloud](/part1/IOTCLOUD.md)
***

# SenseHAT

Use the SenseHAT output node to:

- Set the entire LED panel to a set colour
- Set an individual pixel to a set colour

Exercise - set the background to be blue with a yellow line of pixel diagonally across the panel and a red line across the other diagonal.

Use the SenseHAT input node to:

- Select the set of outputs (Environment sensors, motion and joystick)
- Use the debug node to investigate the format of the data

Exercise - Set the LED panel to the following colours depending on the temperature:

- Blue when temp is less than 0C
- Azul/Turquoise when the temp is 0C or above, but less than 15C
- Green when the temp is 15C or above, but less than 25C
- Yellow when the temp is 25C or above, but less than 40C
- red when the temp is 40C or above

To be able to test your solution use the SenseHAT simulator nodes

``` json
[{"id":"bd285b9d.f00f1","type":"change","z":"25cbaaac.67ac06","name":"","rules":[{"t":"set","p":"payload","pt":"msg","to":"payload.temperature","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":280,"y":240,"wires":[["fa464c76.03ca68"]]},{"id":"77c25ccd.295e74","type":"rpi-sensehatsim in","z":"25cbaaac.67ac06","name":"","motion":false,"env":true,"stick":true,"x":100,"y":260,"wires":[["bd285b9d.f00f1"]]},{"id":"5c025ba.c9836a4","type":"debug","z":"25cbaaac.67ac06","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","x":620,"y":120,"wires":[]},{"id":"7ae297da.60d1a8","type":"rpi-sensehatsim out","z":"25cbaaac.67ac06","name":"","x":800,"y":280,"wires":[]},{"id":"fa464c76.03ca68","type":"switch","z":"25cbaaac.67ac06","name":"","property":"payload","propertyType":"msg","rules":[{"t":"lt","v":"0","vt":"num"},{"t":"btwn","v":"0","vt":"num","v2":"15","v2t":"num"},{"t":"btwn","v":"15","vt":"num","v2":"25","v2t":"num"},{"t":"btwn","v":"25","vt":"num","v2":"40","v2t":"num"},{"t":"gt","v":"40","vt":"num"}],"checkall":"true","repair":false,"outputs":5,"x":450,"y":260,"wires":[["5baae7c1.f4e758","5c025ba.c9836a4"],["10e66657.6a5982","5c025ba.c9836a4"],["f5064273.31ca9","5c025ba.c9836a4"],["faaba703.02c9f","5c025ba.c9836a4"],["5ce56fcc.c649","5c025ba.c9836a4"]]},{"id":"5baae7c1.f4e758","type":"change","z":"25cbaaac.67ac06","name":"blue","rules":[{"t":"set","p":"payload","pt":"msg","to":"*,*,blue","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":590,"y":180,"wires":[["7ae297da.60d1a8","d3e891d9.e7fed8"]]},{"id":"10e66657.6a5982","type":"change","z":"25cbaaac.67ac06","name":"aqua","rules":[{"t":"set","p":"payload","pt":"msg","to":"*,*,aqua","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":590,"y":220,"wires":[["7ae297da.60d1a8","d3e891d9.e7fed8"]]},{"id":"f5064273.31ca9","type":"change","z":"25cbaaac.67ac06","name":"green","rules":[{"t":"set","p":"payload","pt":"msg","to":"*,*,green","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":590,"y":260,"wires":[["7ae297da.60d1a8","d3e891d9.e7fed8"]]},{"id":"faaba703.02c9f","type":"change","z":"25cbaaac.67ac06","name":"yellow","rules":[{"t":"set","p":"payload","pt":"msg","to":"*,*,yellow","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":590,"y":300,"wires":[["7ae297da.60d1a8","d3e891d9.e7fed8"]]},{"id":"5ce56fcc.c649","type":"change","z":"25cbaaac.67ac06","name":"red","rules":[{"t":"set","p":"payload","pt":"msg","to":"*,*,red","tot":"str"}],"action":"","property":"","from":"","to":"","reg":false,"x":590,"y":340,"wires":[["7ae297da.60d1a8","d3e891d9.e7fed8"]]},{"id":"373f7b35.f68ebc","type":"rpi-sensehat in","z":"25cbaaac.67ac06","name":"","motion":true,"env":true,"stick":true,"x":120,"y":220,"wires":[[]]},{"id":"d3e891d9.e7fed8","type":"rpi-sensehat out","z":"25cbaaac.67ac06","name":"","x":790,"y":240,"wires":[]}]
```

***
*Quick links :*
[Home](/README.md) - [**Part 1**](/part1/README.md) - [Part 2](/part2/README.md) - [Part 3](/part3/README.md) - [Part 4](/part4/README.md)
