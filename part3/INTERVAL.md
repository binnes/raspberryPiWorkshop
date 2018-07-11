*Quick links :*
[Home](/README.md) - [Part 1](/part1/README.md) - [Part 2](/part2/README.md) - [**Part 3**](/part3/README.md) - [Part 4](/part4/README.md)
***
**Part 3** - [Intro to Node-RED](/part3/NODERED.md) - [Receive Sensor Data](/part3/DHTDATA.md) - [Plot Data](/part3/DASHBOARD.md) - [Store Data](/part3/CLOUDANT.md) - [Historical Data](/part3/HISTORY.md) - [**Control Interval**](/part3/INTERVAL.md) - [Control LED](/part3/LED.md)
***

# Control the device reporting interval via a Node-RED Dashboard Form

## Lab Objectives

In this lab you will modify the Raspberry Pi Node-RED flow to receive MQTT commands from the IBM Cloud and build a Node-RED Dashboard Form to dynamically change the reporting interval of the environmental sensor data.  You will learn:

- How to build a Node-RED Dashboard Form
- How to send MQTT commands from the IBM Cloud to your device
- How to receive MQTT commands within your Node-RED

### Introduction

Remote management and control of IoT Devices is critical to managing the flow of sensor data to the Cloud. The IoT Device might only need to check in occasionally during quiet periods of inactivity. Waking up the device and requesting that it report sensor data more frequently during active time periods is better for power management, bandwidth consumption and cloud storage.

This section will build a Node-RED Dashboard Form where you can enter a new reporting interval.  A MQTT command will be published from the IBM Cloud to the device. The Raspberry Pi will receive the interval update and adjust how often it transmits the DHT environmental sensor data.

### Step 1 - Import the Node-RED Dashboard Reporting Interval Form Flow

- Open the “Get the Code” github URL listed below, mark or Ctrl-A to select all of the text, and copy the text for the flow to your Clipboard. Recall from a previous section, click on the Node-RED Menu, then Import, then Clipboard. Paste the text of the flow into the Import nodes dialog and press the red Import button.

<p align="center">
  <strong>Get the Code: <a href="flows/NRD-ReportingInterval-Form.json">Node-RED Dashboard Reporting Interval Form Flow</strong></a>
</p>

- Turn to the *Set ESP8266 Interval* flow tab.
- Click the **Deploy** button on the top of menu bar to deploy the Node-RED flow.

![Node-RED Dashboard Form flow screenshot](screenshots/NRD-ReportingIntervalForm-flow.png)

### Step 2 - Node-RED Dashboard Form node

- The Node-RED Dashboard **Form** node can be customized to query user input fields - text, numbers, email addresses, passwords, checkboxes and switches.  Sophisticated forms can be constructed in one Node-RED Dashboard Form node.
- After entering the form data, the user can press **Submit** or **Cancel** buttons.
- When the **Submit** button is pressed the flow constructs a ```msg.payload``` JSON Object with the values entered.
- Double-click on the Dashboard Form node (1). An **Edit form node** sidebar will open.
- This form only has one element (2). It asks in a field labelled *Reporting Interval* for a numeric value. This value will be stored in a variable named *Seconds*
- You might experiment by adding additional elements (3) that could prompt for Text, Numbers, validated email addresses, Passwords (which will be masked when input as * ), Checkmarks or Switches.

![Node-RED Dashboard Form flow node](screenshots/NRD-ReportingIntervalForm-formnode.png)

- Press the Cancel button when you have finished experimenting with the form node.

### Step 3 - Description of the Set ESP8266 Interval flow

- The *Set ESP8266 Interval* flow contains just 5 nodes.
- The Dashboard **Form** node queries the user for a new interval value.
- The result is passed in a ```msg.payload.Seconds``` JSON Object to a **Switch** node which tests if the number entered is equal to or greater than Zero.
- The ```msg.payload``` is reformatted in a **Change** node using the JSONata Expression editor into a JSON Object ```{"Interval":msg.payload.Seconds}```
- The resulting JSON Object is passed to an **IBM IoT out** node.

### Step 4 - Send MQTT Commands using IBM IoT Node

- Double-click on the IBM IoT node (4). An **Edit ibmiot out node** sidebar will open.
- The **IBM IoT out** node is configured to send a **Device Command** (5) to your device Id.
- The **Command Type** will be named *interval* (6).
- Press the red Done button.

![Node-RED Dashboard Form flow node](screenshots/NRD-ReportingIntervalForm-iotnode.png)

### Step 5 - Reprogram the Raspberry Pi to subscribe to MQTT Commands

- Alter the Node-RED flow to receive the interval command and then implement the functionality to change the interval that SenseHAT data is sent to the cloud.
- Use debug nodes to verify that the commands are being received and are sending data at the correct interval

### Step 6 - Node-RED Dashboard Reporting Interval Form

- Turn to the Node-RED Dashboard browser tab, click on the menu tab in the upper left corner, and select the ESP8266 Interval tab.
- On the ESP8266 Interval dashboard, click on the form and enter a new value.
- Click on the **SUBMIT** button.
- The button will trigger the flow to send the new value to the Raspberry Pi over MQTT.

<p align="center">
<img height="247" width="417" src="screenshots/NRD-ReportingIntervalForm.png">
</p>

Proceed to the next section - [**Control ESP8266 LED**](/part3/LED.md)

***
*Quick links :*
[Home](/README.md) - [Part 1](/part1/README.md) - [Part 2](/part2/README.md) - [**Part 3**](/part3/README.md) - [Part 4](/part4/README.md)
