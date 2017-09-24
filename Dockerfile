FROM ros
ARG USER
ARG UID
ARG GID
RUN groupadd capra && useradd -m -u $UID -g $GID -p capra $USER 
RUN echo 'source /opt/ros/$ROS_DISTRO/setup.bash' >> /home/$USER/.bashrc
