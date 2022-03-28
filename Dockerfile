# FROM nvidia/cuda:11.4.2-base-ubuntu20.04
FROM nvcr.io/nvidia/pytorch:22.02-py3

# Build with some basic utilities
RUN apt-get update && apt-get install -y \
    git 

# # alias python='python3'
# RUN ln -s /usr/bin/python3 /usr/bin/python

RUN pip install \
    jupyterlab \
    ipykernel \
    ipywidgets

# Install Dependencies
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]
EXPOSE 8888