FROM ros
ARG USER
ARG UID
ARG GID
RUN groupadd capra -g $GID && useradd -m -u $UID -g $GID -p capra $USERNAME
RUN echo 'source /opt/ros/$ROS_DISTRO/setup.bash' >> /home/$USERNAME/.bashrc
RUN apt-get update && apt-get install -y \
    ros-kinetic-gazebo-ros-pkgs

# Disable MITSHM so gazebo works properly
RUN echo "export QT_X11_NO_MITSHM=1" >> /home/$USERNAME/.bashrc
