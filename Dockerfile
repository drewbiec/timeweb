FROM ubuntu:latest

# install tools and python environment
RUN apt-get update && apt-get install -y \
    vim curl git sudo gcc g++ \
    python3 python3-pip python3-venv python3-dev \
    build-essential libffi-dev libc-dev


# create non-root user for development
RUN useradd -m developer && echo "developer ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/developer

# switch to developer user
USER developer
WORKDIR /home/developer

# clone github repository
RUN git clone https://github.com/drewbiec/timeweb.git

# set up virtual environment
ENV VIRTUAL_ENV=/home/developer/env
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# install dependencies
RUN python3 -m venv $VIRTUAL_ENV && \
    . $VIRTUAL_ENV/bin/activate && \
    pip install --upgrade pip && \
    pip install -r timeweb/requirements.txt

# default to a bash shell when the container starts
CMD ["/bin/bash"]
