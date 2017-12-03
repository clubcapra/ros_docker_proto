FROM ros
ARG USER
ARG UID
ARG GID

RUN apt-get update && apt-get install -y \
    ros-kinetic-gazebo-ros-pkgs \
    ros-kinetic-image-view \
    ros-kinetic-rqt \
    ros-kinetic-rqt-common-plugins \
    ros-kinetic-pointgrey-camera-driver

RUN groupadd capra -g $GID && useradd -m -u $UID -g $GID -p capra $USER

RUN echo 'source /opt/ros/$ROS_DISTRO/setup.bash' >> /home/$USER/.bashrc

# Disable MITSHM so gazebo works properly
RUN echo "export QT_X11_NO_MITSHM=1" >> /home/$USER/.bashrc
