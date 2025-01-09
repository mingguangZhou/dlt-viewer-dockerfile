# dlt-viewer-dockerfile
This repo provides a validated dockerfile that build an image can run dlt-viewer app (on ubuntu 18.04 due to env constraints).
Below are the steps:

1. Download the dockerfile into a local working directory
2. Download the dlt-viewer release linux version from its repo: https://github.com/COVESA/dlt-viewer/release
3. Extract the zip (e.g. DLT-Linux.zip for V2.25.0) and extract the tar.gz inside: $ tar -xvzf DLTViewer-2.25.0-STABLE-qt5.12.10-r960_x86_64-linux-gnu_11.4.0.tgz 
4. Copy all the extracted files into the same directory of the docker file
5. build the docker image (name as an example): $ docker build -t dltviewer:2.25 .
6. load the FUSE (Filesystem in Userspace) kernel module:$ sudo modprobe fuse
7. Allow the Docker container to access the X11 display:$ xhost +local:docker
8. Run the container to start the APP: $ docker run --rm  -it --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix dltviewer:2.25

** Steps 6-8 can also be done using the start script: 
(Terminal at the file path of the downloaded start script) 
Make it executable: $ chmod +x DLTViewer_2.25_Start_Docker.sh
Run the script: sudo ./DLTViewer_2.25_Start_Docker.sh

 
