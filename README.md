## Blender GUI and GPU Render
### NVIDIA Docker and AMDGPU
### Docker image for any Linux

-----
#### Pull image
```
docker pull izone/blender
```
```
```
#### Run
##### download Blender and unpack in host
```
curl -L https://mirror.clarkson.edu/blender/release/Blender2.79/blender-2.79b-linux-glibc219-x86_64.tar.bz2 | sudo tar jxf - -C /opt/
```
```
```
```
docker run -ti --rm --name Blender \
--net=host \
--device /dev/dri \
-e DISPLAY=unix$DISPLAY \
-v $HOME/.Xauthority:/root/.Xauthority \
-v /opt/blender-2.79b-linux-glibc219-x86_64:/mnt \
-w /mnt \
izone/blender ./blender
```
```
```
```
docker run -ti --rm --name Blender \
--net=host \
--device /dev/kfd \
--device /dev/dri \
-e DISPLAY=unix$DISPLAY \
-v /tmp/.X11-unix \
-v $HOME/.Xauthority:/root/.Xauthority \
-v $HOME/Downloads/blender-2.79b-linux-glibc219-x86_64:/mnt \
-w /mnt \
izone/blender ./blender
```

-----
#### NVIDIA Docker (https://github.com/NVIDIA/nvidia-docker)
```
# Install nvidia-docker and nvidia-docker-plugin
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1_amd64.tar.xz
sudo tar --strip-components=1 -C /usr/bin -xvf /tmp/nvidia-docker*.tar.xz && rm /tmp/nvidia-docker*.tar.xz

# Run nvidia-docker-plugin
sudo -b nohup nvidia-docker-plugin > /tmp/nvidia-docker.log

# Test nvidia-smi
nvidia-docker run --rm nvidia/cuda nvidia-smi
```

-----
#### Build
```
docker build -t izone/blender .
```
