ffmpeg -f v4l2 -i /dev/video0 -preset ultrafast -tune zerolatency -v codec libx264 -r 10 -b:v 512k -s 640x360 -f mpegts -flush_packets 0 udp://192.168.0.177:5000?pkt_size=1316
