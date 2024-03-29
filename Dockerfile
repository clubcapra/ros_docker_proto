FROM ros
ARG USER
ARG UID
ARG GID

RUN apt-get update

# Installing every package with a separate RUN command will allow docker to
# cache the image at every step. This reduces the time it takes to rebuild
# after adding a new package to the list, for example.

RUN apt-get install -y python3
RUN apt-get install -y ros-kinetic-gazebo-ros-pkgs
RUN apt-get install -y ros-kinetic-image-view
RUN apt-get install -y ros-kinetic-rqt ros-kinetic-rqt-common-plugins
RUN apt-get install -y ros-kinetic-pointgrey-camera-driver
RUN apt-get install -y ros-kinetic-lms1xx
RUN apt-get install -y ros-kinetic-sick-tim
RUN apt-get install -y vim
RUN apt-get install -y ros-kinetic-astra-camera
RUN apt-get install -y ros-kinetic-astra-launch

RUN groupadd $USER -g $GID && useradd -m -u $UID -g $GID -p capra $USER

RUN echo 'source /opt/ros/$ROS_DISTRO/setup.bash' >> /home/$USER/.bashrc

# Disable MITSHM so gazebo works properly
RUN echo "export QT_X11_NO_MITSHM=1" >> /home/$USER/.bashrc
