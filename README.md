# CHAOStuntap

Required software in: **required_soft.txt**

How to run current tun/tap code:

Follow howto.txt for information on running this code.

List of what files do what:

**ip_monitor.c:**
This code is used to define the writes and reads to the modem device, as well as the codes used for modem resetting from ADI.

**ip_reg_default.sh:**
Put some values into the tmp folder which can be used for modem configuration.

**ip_reg.c:**
Basically the same as ip_monitor but also includes code to configure the modem IP addresses and information.

**kill_modem.sh:**
Kill modem daemon

**mac.c:**
This and modemd.c are the major code running portions of this project. This is what defines the DMA queue read/write as well as setting up the userspace modem IO which can be read and written to. This userspace modem is read/written using this and the ip_reg.c files. I believe the ip_reg files are used for writing to registers on the modem device and mac.c is used for read/write of MAC frames/data.

**modemd.c:**
Slightly higher level than mac.c. This creates the threads that will read and write the actual data. This code also creates the tun/tap used to communicate with kernel and modem PHY. The code is used to set ip address and routes to the tun/tap interface that is created, as well as the signals that come from the kernel that indicate to the userspace daemon that there is data received, data to be sent, or that the modem PHY is not working. This is created with a signal mask and is referred to as a signal handler. This code also contains the functions send_data and receive_data that are the higher level functions to call mac, ip monitor, and ip reg. The functions are run through pthreads, which are a way to create a receive and transmit thread that run independently.

**rfsom-box-gui-start.sh:**
This code contains code that setups required values in tmp files that will be used later and checks that the correct versions of hardware are used. Check for hardware was removed as it wouldnt run with this.

**restart_modem_gui.sh:**
Sets some needed values in tmp files, like stream ip and modem ip. This is the file that actively runs the modemd compiled code to run the tun/tap. 
